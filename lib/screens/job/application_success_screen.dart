import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/app_illustration.dart';
import 'package:lab1_mobile_n2/models/job.dart';
import 'package:lab1_mobile_n2/widgets/job_detail_app_bar.dart';
import 'package:lab1_mobile_n2/widgets/job_header_card.dart';
import 'package:lab1_mobile_n2/widgets/primary_button.dart';
import 'package:lab1_mobile_n2/widgets/light_button.dart';

class ApplicationSuccessScreen extends StatelessWidget {
  const ApplicationSuccessScreen({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const JobDetailAppBar(),
      body: Column(
        children: [
          JobHeaderCard(job: job),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppIllustration(
                    AppIcons.illustSuccess,
                    height: 180,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Successful',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Congratulations, your application\nhas been sent',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 40),
                  LightButton(
                    label: 'FIND A SIMILAR JOB',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.jobDetail,
                        (route) => route.settings.name == AppRoutes.home,
                        arguments: job,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'BACK TO HOME',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
