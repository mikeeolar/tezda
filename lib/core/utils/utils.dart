import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:encrypt/encrypt.dart' as prefix0;
import 'package:encrypt/encrypt.dart';
import 'package:tezda/core/utils/exports.dart';

class Utils {
  static EdgeInsets padding = EdgeInsets.only(
      top: MediaQuery.of(StackedService.navigatorKey!.currentContext!)
              .padding
              .top +
          40.h,
      left: 20.w,
      right: 20.w,
      bottom: 40.h);
  static double statusBarPadding =
      MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top;
  static double get buttonVerticalPadding => Platform.isIOS ? 40.h : 10.h;

  static Color hexToColor(String hexColor) {
    String hex = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hex = 'FF$hexColor';
    }
    final int? temp = int.tryParse(hex, radix: 16);
    return Color(temp ?? 0xFFE41613);
  }

  static BoxDecoration roundedShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.1),
        spreadRadius: 1,
        blurRadius: 8,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static NumberFormat currencyFormatter(int? decimal) {
    return NumberFormat.simpleCurrency(
        locale: 'en_NG', name: '\$', decimalDigits: decimal ?? 2);
  }

  static final normalFormatter = NumberFormat('#,###.##')
    ..minimumFractionDigits = 2
    ..maximumFractionDigits = 2;

  static final iv = IV.fromUtf8(dotenv.env['IV'] ?? '');

  static Encrypter crypt() {
    final appKey = dotenv.env['ENCRYPTION_APP_KEY'];
    final key = prefix0.Key.fromUtf8(appKey ?? '');
    return Encrypter(AES(key, mode: prefix0.AESMode.cbc));
  }

  static String encryptData(String data) {
    return crypt().encrypt(data, iv: iv).base64;
  }

  static String decryptData(String data) {
    return crypt().decrypt64(data, iv: iv);
  }

  static final SystemUiOverlayStyle light = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle lightWhiteNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light);

  static final SystemUiOverlayStyle lightdarkNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light);

  static final SystemUiOverlayStyle dark = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle darkWhiteNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark);

  static String greetingMessage() {
    final timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      return 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow < 16)) {
      return 'Good Afternoon';
    } else if ((timeNow >= 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Evening';
    }
  }

  static List<DropdownMenuItem<T>> getDropdownItem<T>(List<T> items) {
    return items.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(
          '$value',
          style: Theme.of(StackedService.navigatorKey!.currentContext!)
              .textTheme
              .headlineMedium!
              .copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
        ),
      );
    }).toList();
  }
  

  static int getExtendedVersionNumber(String version) {
    return int.parse(version.replaceAll('.', ''));
  }

  static void runAaccountCheck({
    required BuildContext context,
  }) {

  }
}
