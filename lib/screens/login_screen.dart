import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/widgets/auth_footer_link.dart';
import 'package:lab1_mobile_n2/widgets/custom_text_field.dart';
import 'package:lab1_mobile_n2/widgets/primary_button.dart';
import 'package:lab1_mobile_n2/widgets/remember_forgot_row.dart';
import 'package:lab1_mobile_n2/widgets/screen_header.dart';
import 'package:lab1_mobile_n2/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ScreenHeader(
                title: 'Welcome Back',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor.',
              ),
              const SizedBox(height: 28),
              CustomTextField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                obscureText: true,
                showVisibilityToggle: true,
              ),
              const SizedBox(height: 14),
              RememberForgotRow(
                rememberMe: _rememberMe,
                onRememberChanged: (v) => setState(() => _rememberMe = v),
                onForgotTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: 'LOGIN',
                isLoading: _isLoading,
                onPressed: _onLogin,
              ),
              const SizedBox(height: 14),
              SocialButton(
                label: 'SIGN IN WITH GOOGLE',
                variant: SocialButtonVariant.outlined,
                onPressed: () {},
              ),
              const SizedBox(height: 28),
              AuthFooterLink(
                prefix: "You don't have an account yet?",
                linkText: 'Sign up',
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
