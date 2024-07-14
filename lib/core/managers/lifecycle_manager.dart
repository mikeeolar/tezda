import 'dart:async';
import 'package:tezda/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:tezda/core/models/user/user.dart';
import 'package:tezda/core/services/user_service.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/core/utils/store_id.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  const LifeCycleManager({super.key, required this.child});

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthRemoteDataSource _authRemoteDataSource =
      locator<AuthRemoteDataSource>();
  final UserService _userService = locator<UserService>();
  final UtilityService _utilityService = locator<UtilityService>();
  final StorageService _storageService = locator<StorageService>();

  User? get user => _userService.user;
  static const String env = String.fromEnvironment('app.env');

  static const _inactivityTimeout = Duration(minutes: env == 'dev' ? 10 : 5);
  Timer? _keepAliveTimer;
  int min = 10;
  Timer? _timer;

  void _keepAlive(bool visible) {
    if (env != 'dev') {
      _keepAliveTimer?.cancel();
      if (visible) {
        _keepAliveTimer = null;
      } else {
        _keepAliveTimer = Timer(_inactivityTimeout, () {
          log('timeout');
          if (_utilityService.signedIn) {
            _navigationService.clearStackAndShow(Routes.login);
            _utilityService.setSignedIn(false);
          }
        });
      }
    }
  }

  void _refreshToken() {
    _timer = Timer.periodic(Duration(minutes: min), (timer) async {
      Logger.d('REFRESHING: ${_utilityService.signedIn}');
      if (_utilityService.signedIn) {
        final data = await _authRemoteDataSource.refreshToken(
          refreshToken: user?.refreshToken ??
              _storageService.getString(
                StoreId.refreshToken,
              ),
        );

        data.fold((l) {
          setState(() {
            min = 1;
          });
        }, (r) {
          Logger.d('REFRESHED TOKEN: ${r.refreshToken}');
          setState(() {
            min = min;
          });

          _storageService.addString(
              StoreId.refreshToken, r.refreshToken ?? '');
          _userService.addUser(user!.copyWith(
              token: r.accessToken, refreshToken: r.refreshToken));
        });
      } else {
        setState(() {
          min = min;
        });
      }
    });
  }

  @override
  void initState() {
    _keepAlive(false);
    super.initState();
    _refreshToken();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _keepAlive(false);
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        onPanDown: (_) => _keepAlive(false),
        child: widget.child);
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    Logger.d('$state');
    switch (state) {
      case AppLifecycleState.resumed:
        _keepAlive(false);
        // _refreshToken();
        Logger.d('$state');
        break;
      case AppLifecycleState.inactive:
        Logger.d('$state');
        break;
      case AppLifecycleState.hidden:
        Logger.d('$state');
        break;
      case AppLifecycleState.paused:
        Logger.d('$state');
        break;
      case AppLifecycleState.detached:
        Logger.d('$state');
        _keepAlive(false);
        _timer?.cancel();
        break;
    }
  }
}
