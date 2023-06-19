import 'package:flutter/material.dart';
import 'package:more_practice/pages/Home/home_Page.dart';
import 'package:more_practice/pages/Home/profile_page.dart';
import 'package:more_practice/pages/login/login_screen.dart';
import 'package:more_practice/theme/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _isObscure = true;
  var _Obscure = true;

 final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(

        centerTitle: true,
        title: const Text('Change Password', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold), ),
        elevation: 1,

        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=> HomePage(),));
        }, icon: Icon(Icons.arrow_back),),

        backgroundColor: primaryColor,

      ),
      body: Form(

        child: Padding(padding: Tpadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                ),

                TextFormField(
                  controller: _passController,
                  obscureText: _isObscure,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: 'Current Password',
                    hintText: 'Current Password',
                    border: OutlineInputBorder(),

                    suffixIcon:  IconButton(

                      onPressed:(){

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

                SizedBox(height: 20,),

                TextFormField(

                  controller: _confirmPassController,
                  obscureText: _Obscure,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: 'New Password',
                    hintText: 'New Password',
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(

                      onPressed:(){

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

                SizedBox(height: 40,),

                //confirm button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=> LoginScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: buttonHeight),
                      backgroundColor: blackColor,
                    ),
                    child: Text('Confirm'.toUpperCase(), style: TextStyle(fontSize: 16),),),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );

  }
}
