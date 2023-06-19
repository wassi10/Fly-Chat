import 'package:flutter/material.dart';
import 'package:more_practice/pages/login/login_screen.dart';
import 'package:more_practice/theme/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Reset Password'),
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }, icon: Icon(Icons.arrow_back),),

      ),
      body: SingleChildScrollView(
          child: Container(
            padding: Tpadding,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text('Forget Password', style: style,textAlign: TextAlign.center,),

                SizedBox(height: 40,),
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Email"),
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 30,),
                        SizedBox(
                          width: double.infinity,

                          child: ElevatedButton(

                            onPressed: (){},

                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: buttonHeight),
                              backgroundColor: blackColor,
                            ),
                            child: Text('Next'),
                          ),
                        ),

                      ],
                    ))
              ],
            ),
          )
      ),
    ),
    );
  }
}
