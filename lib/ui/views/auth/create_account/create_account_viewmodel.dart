// ignore_for_file: deprecated_member_use

import 'package:tezda/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:tezda/core/models/user/user.dart';
import 'package:tezda/core/services/auth_service.dart';
import 'package:tezda/core/services/user_service.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/core/utils/store_id.dart';

class CreateAccountViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();
  final StorageService _storageService = locator<StorageService>();
  final UtilityService _utilityService = locator<UtilityService>();

  final AuthRemoteDataSource _authRemoteDataSource =
      locator<AuthRemoteDataSource>();

  User? get user => _userService.user;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String? _name;
  String? get name => _name;
  set name(String? val) {
    _name = val;
    notifyListeners();
  }

  String? _email;
  String? get email => _email;
  set email(String? val) {
    _email = val;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  set password(String? val) {
    _password = val;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool val) {
    _obscurePassword = val;
    notifyListeners();
  }

  Future setup() async {}
  Future createUser() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.5),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.createUser(
      name: name,
      password: password,
      email: email,
    );

    data.fold((l) {
      _dialogService.completeDialog(DialogResponse());
      flusher(l.message, color: Colors.red);
    }, (r) {
      _authService.userData = r;
      login();
    });
  }

  Future login() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.5),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.login(
      email: email ?? user?.loginUsername ?? '',
      password: password ?? user?.password ?? '',
    );

    data.fold((l) {
      _dialogService.completeDialog(DialogResponse());
      flusher(l.message, color: Colors.red);
    }, (r) {
      log('Login response: $r');
      _authService.authenticationResponse = r;

      //save user object to local storage
      _userService.addUser(User(
          token: r.accessToken,
          refreshToken: r.refreshToken,
          loginUsername: email ?? user?.loginUsername ?? '',
          password: password));

      _storageService.addString(StoreId.refreshToken, r.refreshToken ?? '');

      fetchUserDetails();
      notifyListeners();
    });
  }

  Future fetchUserDetails() async {
    final data = await _authRemoteDataSource.fetchUserDetails();

    data.fold((l) {
      _dialogService.completeDialog(DialogResponse());
      flusher(l.message, color: Colors.red);
    }, (r) {
      _dialogService.completeDialog(DialogResponse());
      _authService.userData = r;
      _utilityService.setSignedIn(true);
      _navigationService.clearStackAndShow(Routes.dashboard);
    });
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.login);
  }
}
