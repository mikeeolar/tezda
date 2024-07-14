import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:tezda/core/data_source/product_remote_data_source/product_remote_data_source.dart';
import 'package:tezda/core/data_source/product_remote_data_source/product_remote_data_source_impl.dart';
import 'package:tezda/core/services/product_service/product_service.dart';
import 'package:tezda/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tezda/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:tezda/core/data_source/auth_remote_data_source/auth_remote_data_source_impl.dart';
import 'package:tezda/core/services/auth_service.dart';
import 'package:tezda/core/services/device_info_service.dart';
import 'package:tezda/core/services/http/http_service_impl.dart';
import 'package:tezda/core/services/user_service.dart';
import 'package:tezda/core/utils/exports.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false}) async {
  final Directory appDocDir =
      test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  if (!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
    locator.registerLazySingleton<FirebaseMessaging>(
        () => FirebaseMessaging.instance);
  }

  //--------------------------Services------------------------------
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<DashboardViewModel>(() => DashboardViewModel());
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<UtilityService>(() => UtilityService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
  locator.registerLazySingleton<DeviceInfoService>(
      () => DeviceInfoService()..initDeviceInfo());

  //--------------------------Date Source------------------------------
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());

  Logger.d('Initializing boxes...');
  await UserService().init();
  await StorageService().init();
}
