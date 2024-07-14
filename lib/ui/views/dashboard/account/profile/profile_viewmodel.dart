import 'package:tezda/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:tezda/core/models/authentication_response/authentication_response.dart';
import 'package:tezda/core/models/authentication_response/profile_response.dart';
import 'package:tezda/core/services/auth_service.dart';
import 'package:tezda/core/utils/exports.dart';

class ProfileViewModel extends ReactiveViewModel {
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final UtilityService _utilityService = locator<UtilityService>();

  final AuthRemoteDataSource _authRemoteDataSource =
      locator<AuthRemoteDataSource>();

  AuthenticationResponse? get authResponse =>
      _authService.authenticationResponse;

  ProfileResponse? get user => _authService.userData;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  Future setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailCtrl.text = user?.email ?? '';
      nameCtrl.text = user?.name ?? '';
    });
  }

  Future updateAccount() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withOpacity(0.5),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.updateUserAccount(
      id: user?.id,
      email: emailCtrl.text,
      name: nameCtrl.text,
      avatar: 'https://i.imgur.com/LDOO4Qs.jpg',
    );

    data.fold((l) {
      _dialogService.completeDialog(DialogResponse());
      flusher(l.message, color: Colors.red);
    }, (r) {
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
      flusher('Profile successfully updated', color: Colors.green);
    });
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_authService, _utilityService];
}
