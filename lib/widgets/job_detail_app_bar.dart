import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';

class JobDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JobDetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const AppSvgIcon(AppIcons.arrowBack, size: 20, color: AppColors.heading),
        onPressed: () => Navigator.maybePop(context),
      ),
      actions: [
        IconButton(
          icon: const AppSvgIcon(AppIcons.more, size: 26, color: AppColors.heading),
          onPressed: () {},
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
