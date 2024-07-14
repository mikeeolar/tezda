import 'package:tezda/core/utils/exports.dart';

class PreloadImageUtil {
  PreloadImageUtil._();

  static Future<void> loadCacheImages() async {
    Future.wait([
      // other SVGs or images here
    ]);
  }
}

Future precacheSvgPicture(String svgPath) async {
  final logo = SvgAssetLoader(svgPath);
  await svg.cache.putIfAbsent(logo.cacheKey(null), () => logo.loadBytes(null));
}