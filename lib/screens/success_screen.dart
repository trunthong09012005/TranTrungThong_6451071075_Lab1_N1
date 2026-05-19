import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/widgets/primary_button.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/widgets/app_illustration.dart';
import 'package:lab1_mobile_n2/widgets/screen_header.dart';
import 'package:lab1_mobile_n2/widgets/secondary_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppIllustration(
                AppIcons.illustSuccess,
                height: 210,
              ),
              const SizedBox(height: 20),
              const ScreenHeader(
                title: 'Successfully',
                subtitle:
                    'Your password has been updated. You can now sign in with '
                    'your new credentials.',
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: 'CONTINUE',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'BACK TO LOGIN',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
