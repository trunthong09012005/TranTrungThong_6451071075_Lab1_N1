import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/di/injection.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/core/theme/app_colors.dart';
import 'package:lab1_mobile_n2/widgets/jobspot_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      final isLoggedIn = Injection.instance.getAuthStateUseCase.currentUser != null;
      Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? AppRoutes.home : AppRoutes.onboarding,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: JobspotLogo(variant: LogoVariant.splash),
      ),
    );
  }
}
