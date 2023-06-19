import 'package:flutter/material.dart';
import 'package:more_practice/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'welcomeScreen.dart';

class OnBoardingScreens extends StatefulWidget {


  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {

  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose(){
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(

        padding: const EdgeInsets.only(bottom: 80),

        child: PageView(
          controller: _controller,
          onPageChanged: (index){
            setState(() => isLastPage= index == 2);
          },
          children: [

            //page 1
            Container(
              padding: const EdgeInsets.all(35.0),
              color: onbrd1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: const AssetImage(onboard1), height: size.height * 0.4,),
                  Column(
                    children: const [
                      Text("Awesome Chatting App", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Let's start your chatting journey with this amazing chattify app",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),)
                    ],
                  ),
                  const Text("1/3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 40,),

                ],
              ),

            ),

            //page 2
            Container(
              padding: const EdgeInsets.all(35.0),
              color: onbrd2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: const AssetImage(onboard2), height: size.height * 0.4,),
                  Column(
                    children: const [
                      Text("Let's start Chatting", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Let's start your chatting journey with this amazing chattify app",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),)
                    ],
                  ),
                  const Text("2/3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 40,),

                ],
              ),

            ),

            //page 3
            Container(
              padding: const EdgeInsets.all(35.0),
              color: onbrd3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: const AssetImage(onboard3), height: size.height * 0.4,),
                  Column(
                    children: const [
                      Text("Make your moment Beautiful", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Let's start your chatting journey with this amazing chattify app",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),)
                    ],
                  ),
                  const Text("3/3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 40,),

                ],
              ),

            ),
          ],
        ),
       ),

      //bottom button
      bottomSheet: isLastPage ? TextButton(
        onPressed: () async{

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(),),);
        },
        style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        primary: whiteColor,
          backgroundColor: Colors.white70,
          minimumSize: const Size.fromHeight(80),
        ),
        child: const Text('Get Started', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),),)

      : Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 80,
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //skip button
            TextButton(onPressed: ()=> _controller.jumpToPage(2), child: const Text("SKIP", style:
            TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),)),

            //dot indicator
            Center(
              child: SmoothPageIndicator(controller: _controller, count: 3,
              effect: const WormEffect(
                spacing: 16,
                dotColor: whiteColor,
                activeDotColor:blackColor,
              ),
                onDotClicked: (index) => _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
              ),
            ),

            //next button
            TextButton(onPressed: () =>_controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut) , child: const Text("NEXT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),)),
          ],
        ),
      ),
    );
  }
}
