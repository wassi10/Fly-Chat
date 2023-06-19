import 'package:flutter/material.dart';
import 'package:more_practice/theme/colors.dart';
import '../pages/login/login_screen.dart';
import '../pages/login/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,

      body: Container(
        padding: EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(welcomeImage),height: height * 0.5,),
            Text(textString, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

            Row(
              children: [

                //Login button
               Expanded(
                 child:  OutlinedButton(

                 onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                 },

                   style: OutlinedButton.styleFrom(
                     shape: RoundedRectangleBorder(),
                     foregroundColor: blackColor,
                     side: BorderSide(color: blackColor),
                     padding: EdgeInsets.symmetric(vertical: buttonHeight),

                   ),
                   child: Text('Login'.toUpperCase(), style: TextStyle(fontSize: 16),),
               ),
               ),

                SizedBox(width: 15,),

                //regsister button
                Expanded(
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: whiteColor,
                      backgroundColor: blackColor,
                      side: BorderSide(color: blackColor),
                      padding: EdgeInsets.symmetric(vertical: buttonHeight),

                    ),

                    child: Text('Sign up'.toUpperCase(), style: TextStyle(fontSize: 16),),
                ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
