import 'package:flutter/material.dart';
import 'package:more_practice/theme/colors.dart';
import '../auth_pass/forgot_pass/forgot_PassButton_widget.dart';
import '../auth_pass/forgot_pass/forgot_Password.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: Tpadding,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120,),

              const Text(welcome, style: style,),

              //creating form
          Form(
              key: _formKey,

              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30.0),

                child: Column(

                  children:  [

                    TextFormField(


                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),

                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter password';
                        }
                        return null;
                      },

                    ),

                    const SizedBox(height: 10.0,),

                    TextFormField(

                      obscureText: _isObscure,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.fingerprint),
                        labelText: 'Password',
                        hintText: 'Password',
                        border: OutlineInputBorder(),

                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },  icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        ),

                      ),

                    ),


                    //forgot password
                    Align(
                      alignment: Alignment.centerRight,

                      child:  TextButton(
                        onPressed: (){
                          showModalBottomSheet(context: context, builder: (context)=> Container(
                            padding: Tpadding,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text('Make Selection!', style: style,),
                                SizedBox(height: 4,),
                                Text('Select one of the options given below to reset your password', style: TextStyle(color: Colors.grey.shade500, fontSize: 16, fontWeight: FontWeight.w500),),

                                SizedBox(height: 30,),

                                //forgot password
                                ForgotPasswordBtnWidget( btnIcon: Icons.email_outlined, title: 'E-mail', subtitle: 'Reset via mail',
                                  onTap: (){
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgotPassword(),));
                                  },),

                                SizedBox(height: 20,),

                                ForgotPasswordBtnWidget( btnIcon: Icons.mobile_friendly, title: 'Phone no', subtitle: 'Reset via phone', onTap: (){
                                  // Navigator.pop(context);
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgotPassword(),));
                                },),

                              ],
                            ),
                          ));
                        },

                        child: Text('Forget Password?', style: TextStyle(fontSize: 16, color: Colors.grey.shade500
                        ),),),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    //submit button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},

                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: buttonHeight),
                          backgroundColor: blackColor,
                        ),
                        child: Text('Login'.toUpperCase()),),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(height: 20,),

                        Text('Or', style: TextStyle(fontSize: 16, color: Colors.grey.shade500), ),

                        SizedBox(height: 20,),

                        //signup with google
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: (){},

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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                          }
                          ,
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Create an account', style: TextStyle(color: blackColor, fontSize: 16)),
                                TextSpan(text: '  Sign Up', style: TextStyle(color: primaryColor, fontSize: 16)),
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
