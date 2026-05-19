import 'package:flutter/material.dart';

/// Figma / undraw illustration — sized for device pixel ratio to stay sharp.
class AppIllustration extends StatelessWidget {
  const AppIllustration(
    this.asset, {
    super.key,
    this.height = 220,
    this.fit = BoxFit.contain,
  });

  final String asset;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final cacheHeight = (height * dpr).round();

    return RepaintBoundary(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            asset,
            height: height,
            fit: fit,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
            cacheHeight: cacheHeight,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}

/// App logo from PNG — crisp on splash / wordmark.
class AppLogoImage extends StatelessWidget {
  const AppLogoImage({
    super.key,
    required this.asset,
    required this.size,
    this.borderRadius = 14,
  });

  final String asset;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final cache = (size * dpr).round();

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        asset,
        width: size,
        height: size,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        isAntiAlias: true,
        cacheWidth: cache,
        cacheHeight: cache,
        gaplessPlayback: true,
      ),
    );
  }
}
