import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:more_practice/Screens/Splash_screen.dart';
import 'package:more_practice/Screens/welcomeScreen.dart';
import 'package:more_practice/pages/Home/home_Page.dart';
import 'package:more_practice/Screens/_onboarding_screen.dart';
import 'package:more_practice/pages/auth_pass/firebaseAuth/authentication_repository.dart';
import 'package:more_practice/pages/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {

  final bool showHome;
  MyApp({
    Key ? key,
    required this.showHome,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: //LoginScreen(),
      //HomePage(),
     showHome ? WelcomeScreen() : SplashScreen(),
     // OnBoardingScreens(),
      //SplashScreen(),

    );
  }
}

