import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_illustration.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';

class JobspotLogo extends StatelessWidget {
  const JobspotLogo({
    super.key,
    this.variant = LogoVariant.splash,
  });

  final LogoVariant variant;

  @override
  Widget build(BuildContext context) {
    final isSplash = variant == LogoVariant.splash;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSplash)
          const AppLogoImage(
            asset: AppIcons.logoApp,
            size: 72,
            borderRadius: 16,
          )
        else
          const AppSvgIcon(AppIcons.logoMark, size: 22, color: AppColors.accent),
        const SizedBox(height: 18),
        Text(
          'Jobspot',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: isSplash ? AppColors.white : AppColors.primary,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

enum LogoVariant { splash, mark }

class JobspotWordmark extends StatelessWidget {
  const JobspotWordmark({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLogoImage(
          asset: AppIcons.logoApp,
          size: 24,
          borderRadius: 7,
        ),
        SizedBox(width: 8),
        Text(
          'Jobspot',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
