import 'package:flutter_svg/svg.dart';

class AssetsUtils{
  static Future<void> preloadSVGs() async {
    final assets = [
      // App Svg Icons
    ];
    for (final asset in assets) {
      final loader = SvgAssetLoader(asset);
      await svg.cache.putIfAbsent(
        loader.cacheKey(null),
            () => loader.loadBytes(null),
      );
    }
  }
}