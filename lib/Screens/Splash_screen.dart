import 'dart:async';

import 'package:flutter/material.dart';
import 'package:more_practice/theme/colors.dart';
import '_onboarding_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;


  void initState(){
    startAnimation();

  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
   return Scaffold(
     backgroundColor: primaryColor,
       body: SafeArea(child: Stack(
         children:  [
           AnimatedPositioned(
             duration: const Duration(microseconds: 2400),
             top: 100,
             left: 20,
             right: 20,

             child: Image(image: AssetImage(splashImage),height: height * 0.4,)),


           AnimatedPositioned(
               duration: const Duration(microseconds: 1600),
             bottom:  200,
               left: 130,


                  child: Text('Welcome\nChatify App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: whiteColor),)),

         ],
       ))
   );

       //
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 600));
    setState(() => animate = true);
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> OnBoardingScreens()));
  }
}
