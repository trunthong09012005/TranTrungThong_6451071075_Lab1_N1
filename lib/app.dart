import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/core/routes/app_routes.dart';
import 'package:lab1_mobile_n2/core/theme/app_theme.dart';
import 'package:lab1_mobile_n2/models/job.dart';
import 'package:lab1_mobile_n2/screens/check_email_screen.dart';
import 'package:lab1_mobile_n2/screens/forgot_password_screen.dart';
import 'package:lab1_mobile_n2/screens/home/home_shell.dart';
import 'package:lab1_mobile_n2/screens/job/application_success_screen.dart';
import 'package:lab1_mobile_n2/screens/job/job_detail_screen.dart';
import 'package:lab1_mobile_n2/screens/job/upload_cv_screen.dart';
import 'package:lab1_mobile_n2/screens/login_screen.dart';
import 'package:lab1_mobile_n2/screens/onboarding_screen.dart';
import 'package:lab1_mobile_n2/screens/signup_screen.dart';
import 'package:lab1_mobile_n2/screens/splash_screen.dart';
import 'package:lab1_mobile_n2/screens/success_screen.dart';

class JobspotApp extends StatelessWidget {
  const JobspotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab1_mobile_n2',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _page(const SplashScreen(), settings);
      case AppRoutes.onboarding:
        return _page(const OnboardingScreen(), settings);
      case AppRoutes.login:
        return _page(const LoginScreen(), settings);
      case AppRoutes.signup:
        return _page(const SignupScreen(), settings);
      case AppRoutes.forgotPassword:
        return _page(const ForgotPasswordScreen(), settings);
      case AppRoutes.checkEmail:
        final email = settings.arguments as String? ?? 'user@email.com';
        return _page(CheckEmailScreen(email: email), settings);
      case AppRoutes.passwordSuccess:
        return _page(const SuccessScreen(), settings);
      case AppRoutes.home:
        return _page(const HomeShell(), settings);
      case AppRoutes.jobDetail:
        final job = settings.arguments! as Job;
        return _page(JobDetailScreen(job: job), settings);
      case AppRoutes.uploadCv:
        final job = settings.arguments! as Job;
        return _page(UploadCvScreen(job: job), settings);
      case AppRoutes.applicationSuccess:
        final job = settings.arguments! as Job;
        return _page(ApplicationSuccessScreen(job: job), settings);
      default:
        return _page(const SplashScreen(), settings);
    }
  }

  MaterialPageRoute<dynamic> _page(Widget child, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => child,
    );
  }
}
