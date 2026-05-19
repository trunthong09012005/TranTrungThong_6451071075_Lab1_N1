import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = SocialButtonVariant.outlined,
  });

  final String label;
  final VoidCallback? onPressed;
  final SocialButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final isPurple = variant == SocialButtonVariant.purple;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isPurple ? AppColors.secondary : AppColors.white,
          foregroundColor: isPurple ? AppColors.white : AppColors.primary,
          side: BorderSide(
            color: isPurple ? AppColors.secondary : AppColors.border,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppSvgIcon(AppIcons.google, size: 22),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
                color: isPurple ? AppColors.white : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SocialButtonVariant { outlined, purple }
