import 'package:disiability/pages/auth/signin_screen/sigin_screen.dart';
import 'package:disiability/pages/auth/signup_screen/signup_screen.dart';
import 'package:disiability/pages/home/home_screen.dart';
import 'package:disiability/pages/landing/landing_screen.dart';
import 'package:disiability/pages/splash/splash_screen.dart';
import 'package:disiability/pages/translate_s_t/translate_sign_to_text.dart';
import 'package:disiability/pages/translate_t_s/translate_text_to_sign.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/splash": (context)=>const SplashScreen(),
  "/landing": (context)=> const LandingScreen(),
  "/home": (context) =>const HomeScreen(),
  "/translateSignToText": (context)=> const TranslateSignToText(),
  "/signIn": (context)=> const SignIn(),
  "/signUp": (context)=> const SignUP(),
  "/translateTextToSign": (context)=> const TranslateTextToSign()

};