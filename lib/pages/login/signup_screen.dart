import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:more_practice/pages/Home/home_Page.dart';
import 'package:more_practice/pages/auth_pass/login_auth/signup_auth_Controller.dart';
import 'package:more_practice/pages/login/login_screen.dart';

import '../../theme/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _isObscure = true;
  var _Obscure = true;



  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();


    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: Tpadding,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 50,),
                  const Text(signupwelcome, style: style,),

                  //creating form
                  Form(
                    key: _formKey,

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),

                        child: Column(

                          children:  [

                            TextFormField(

                              controller: controller.fullname,

                              decoration:  InputDecoration(
                                prefixIcon: Icon(Icons.person_outline_outlined),
                                labelText: 'Full Name',
                                hintText: 'Full Name',
                                border: OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 10.0,),

                             TextFormField(
                                 controller: controller.email,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                labelText: 'Email',
                                hintText: 'Email',
                                border: OutlineInputBorder(),

                              ),
                            ),
                            const SizedBox(height: 10.0,),

                       TextFormField(
                         controller: controller.phoneNo,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.numbers_outlined),
                                labelText: 'Phone No',
                                hintText: 'Phone No',
                                border: OutlineInputBorder(),

                              ),
                            ),
                            const SizedBox(height: 10.0,),

                             TextFormField(
                               controller: controller.pass,
                               obscureText: _isObscure,
                              decoration:  InputDecoration(
                                prefixIcon: Icon(Icons.fingerprint),
                                labelText: 'Password',
                                hintText: 'Password',
                                border: OutlineInputBorder(),

                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }, icon: Icon(
                                  _isObscure ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                ),

                              ),
                            ),
                            const SizedBox(height: 10.0,),

                            TextFormField(
                              controller: controller.confirmpass,
                              obscureText: _Obscure,
                              decoration:  InputDecoration(
                                prefixIcon: Icon(Icons.password_outlined),
                                labelText: 'Confirm Password',
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder(),

                                suffixIcon: IconButton(
                                  onPressed: (){

                                    setState(() {
                                      _Obscure = !_Obscure;
                                    });

                                  }, icon: Icon(
                                  _Obscure ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                ),
                              ),
                            ),




                            SizedBox(
                              height: 35,
                            ),

                            //submit button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){

                                  // if(_formKey.currentState!.validate()){
                                  //
                                  //   SignUpController.instance.registerUser(controller.email.text.trim(), controller.pass.text.trim());
                                  // }
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                                },

                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: buttonHeight),
                                  backgroundColor: blackColor,
                                ),
                                child: Text('Sign Up'.toUpperCase()),),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                SizedBox(height: 10,),

                                Text('Or', style: TextStyle(fontSize: 16, color: Colors.grey.shade500), ),

                                SizedBox(height: 10,),

                                //signup with google
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                    onPressed: (){

                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: buttonHeight),
                                      side: BorderSide(color: blackColor),
                                    ),
                                    label: Text('Sign In with Google', style: TextStyle(fontSize: 16, color: blackColor),),
                                    icon: Image(image: AssetImage(googleImg), width: 20.0,),
                                  ),
                                ),

                                TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: 'Already have an Account', style: TextStyle(color: blackColor, fontSize: 16)),
                                        TextSpan(text: '  Sign In', style: TextStyle(color: primaryColor, fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),

          ),
        ));
  }
}
