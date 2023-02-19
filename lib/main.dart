import 'package:disiability/pages/splash/splash_screen.dart';
import 'package:disiability/routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          displaySmall: TextStyle(color: Colors.grey, fontSize: 14),
          displayMedium: TextStyle(color: Colors.white, fontSize: 16)

      ),

        scaffoldBackgroundColor: Colors.black
      ),
      routes: routes,
      initialRoute: "/splash",
    );
  }
}


