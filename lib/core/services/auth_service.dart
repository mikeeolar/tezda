import 'package:tezda/core/models/authentication_response/authentication_response.dart';
import 'package:tezda/core/models/authentication_response/profile_response.dart';
import 'package:tezda/core/utils/exports.dart';

class AuthService with ListenableServiceMixin {
  AuthenticationResponse? _authenticationResponse;
  AuthenticationResponse? get authenticationResponse => _authenticationResponse;
  set authenticationResponse(AuthenticationResponse? val) {
    _authenticationResponse = val;
    notifyListeners();
  }

  ProfileResponse? _userData;
  ProfileResponse? get userData => _userData;
  set userData(ProfileResponse? val) {
    _userData = val;
    notifyListeners();
  }

  AuthService() {
    listenToReactiveValues([_authenticationResponse, _userData]);
  }
}
