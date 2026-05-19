import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/widgets/custom_text_field.dart';
import 'package:lab1_mobile_n2/widgets/primary_button.dart';
import 'package:lab1_mobile_n2/core/assets/app_icons.dart';
import 'package:lab1_mobile_n2/widgets/app_illustration.dart';
import 'package:lab1_mobile_n2/widgets/screen_header.dart';
import 'package:lab1_mobile_n2/widgets/secondary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onReset() {
    final email = _emailController.text.trim().isEmpty
        ? 'user@email.com'
        : _emailController.text.trim();
    Navigator.pushNamed(
      context,
      AppRoutes.checkEmail,
      arguments: email,
    );
  }

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
                AppIcons.illustForgotPassword,
                height: 210,
              ),
              const SizedBox(height: 20),
              const ScreenHeader(
                title: 'Forgot Password?',
                subtitle:
                    'Enter your email address and we will send you instructions '
                    'to reset your password.',
              ),
              const SizedBox(height: 24),
              CustomTextField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: 'RESET PASSWORD',
                onPressed: _onReset,
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'BACK TO LOGIN',
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(AppRoutes.login),
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
