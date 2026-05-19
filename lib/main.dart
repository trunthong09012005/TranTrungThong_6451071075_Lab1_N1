import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab1_mobile_n2/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const JobspotApp());
}
