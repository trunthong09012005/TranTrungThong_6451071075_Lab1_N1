import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_illustration.dart';
import 'package:lab1_mobile_n2/widgets/app_svg_icon.dart';
import 'package:lab1_mobile_n2/widgets/jobspot_logo.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: JobspotWordmark(),
              ),
              const SizedBox(height: 8),
              const AppIllustration(
                AppIcons.onboarding,
                height: 260,
              ),
              const SizedBox(height: 28),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.displaySmall,
                  children: const [
                    TextSpan(text: 'Find Your '),
                    TextSpan(
                      text: 'Dream Job',
                      style: TextStyle(color: AppColors.accent),
                    ),
                    TextSpan(text: '\nHere!'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Explore thousands of jobs, build your resume, and find '
                'the role that fits you best with Jobspot.',
                style: bodyStyle,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 36),
                  child: Material(
                    color: AppColors.primary,
                    elevation: 6,
                    shadowColor: AppColors.primary.withValues(alpha: 0.4),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },
                      child: const SizedBox(
                        width: 56,
                        height: 56,
                        child: Center(
                          child: AppSvgIcon(
                            AppIcons.arrowRight,
                            size: 26,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
