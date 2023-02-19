import 'package:disiability/pages/home/home_screen.dart';
import 'package:disiability/pages/landing/landing_screen.dart';
import 'package:disiability/pages/splash/splash_screen.dart';
import 'package:disiability/pages/translate_s_t/translate_sign_to_text.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/splash": (context)=>const SplashScreen(),
  "/landing": (context)=> const LandingScreen(),
  "/home": (context) =>const HomeScreen(),
  "/translateSignToText": (context)=> const TranslateSignToText(),
};