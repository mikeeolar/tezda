import 'package:tezda/core/models/user/user.dart';
import 'package:tezda/core/services/user_service.dart';
import 'package:tezda/core/utils/exports.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();

  User? get user => _userService.user;

  int activeIndex = 0;

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.login);
  }

  void navigateCreateAccount() {
    _navigationService.navigateTo(Routes.createAccount);
  }
}
