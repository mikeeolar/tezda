import 'package:hive/hive.dart';
import 'package:tezda/core/models/user/user.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/core/utils/hive_boxes.dart';

class UserService with ListenableServiceMixin {
  User? _user;
  User? get user => _user;

  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.user);
  Box<User> get _userBox => _hiveService.box<User>(HiveBox.user);

  UserService() {
    listenToReactiveValues([_user]);
  }

  Future<void> init() async {
    _hiveService.registerAdapter(UserAdapter());

    if (!_isBoxOpen) {
      await _hiveService.openBox<User>(HiveBox.user);
    }
  }

  Future addUser(User user) async {
    log('ADDinG ${user.token}');
    getUser();
    await _userBox.put(0, user);
    getUser();
    _user = user;
    notifyListeners();
  }

  void getUser() {
    _user = _userBox.get(0);
    notifyListeners();
  }

  Future clear() async {
    log('CLEEEEARR');
    await _userBox.clear();
    notifyListeners();
    getUser();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
