import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/widgets/primary_button.dart';
import 'package:lab1_mobile_n2/widgets/remember_forgot_row.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/widgets/app_illustration.dart';
import 'package:lab1_mobile_n2/widgets/screen_header.dart';
import 'package:lab1_mobile_n2/widgets/secondary_button.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key, required this.email});

  final String email;

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
                AppIcons.illustCheckEmail,
                height: 210,
              ),
              const SizedBox(height: 20),
              ScreenHeader(
                title: 'Check Your Email',
                subtitle:
                    'We have sent password recovery instructions to your email $email.',
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: 'OPEN YOUR EMAIL',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.passwordSuccess);
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
              const SizedBox(height: 24),
              ResendLink(
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email đã được gửi lại')),
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
