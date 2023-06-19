import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:more_practice/Screens/welcomeScreen.dart';
import 'package:more_practice/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(

      body: Stack(
        alignment: Alignment.center,

        children: [
          LiquidSwipe(
            liquidController: controller,
            pages: [
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
                        Text("Let's start your chatting journey with this amazing chattify app",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    const Text("1/3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                    const SizedBox(height: 50,),

                  ],
                ),

              ),

              Container(
                padding: const EdgeInsets.all(35.0),
                color: onbrd2,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: const AssetImage(onboard2), height: size.height * 0.4,),
                    Column(
                      children: const [
                        Text("Bulding Chatting App", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("Let's start your chatting journey with this amazing chattify app",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    const Text("2/3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                    const SizedBox(height: 50,),
                  ],
                ),
              ),

              Container(
                color: onbrd3,
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: const AssetImage(onboard3), height: size.height * 0.4,),
                    Column(
                      children: const [
                        SizedBox(height: 36,),
                        Text("Welcome To Chatify app", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("Let's start your chatting journey with this amazing chattify app",textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    const SizedBox(height: 1,),
                    const Text("3/3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                    const SizedBox(height: 0,),

                    Positioned(
                      bottom: 60.0,
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));

                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black26),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(5),
                          onPrimary: Colors.white,
                        ),

                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: blackColor, shape: BoxShape.circle
                          ),
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),),
                  ],
                ),

              ),
            ],
            enableSideReveal: true,
            onPageChangeCallback: onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),


          ),

          //button

          //skip button
          Positioned(
              top: 40,
              right: 20,
              child: TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                  },
                  child: const Text("Skip", style: TextStyle(color: Colors.blueGrey, fontSize: 18),))),
          Positioned(
              bottom: 40,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: const WormEffect(
                    activeDotColor: Color(0xff272727),
                    dotHeight: 7.0
                ),
              ))
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}

