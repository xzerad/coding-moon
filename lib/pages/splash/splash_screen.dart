import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacementNamed("/landing");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Image.asset("lib/assets/images/logo.png"),
      ),


    );
  }
}
