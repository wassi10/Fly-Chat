
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBtnWidget extends StatelessWidget {
  const ForgotPasswordBtnWidget({
    Key? key, required this.btnIcon, required this.title, required this.subtitle, required this.onTap,
  }) : super(key: key);

  final IconData btnIcon;
  final  String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),

        child: Row(
          children: [
            Icon(btnIcon, size: 50,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, ),),
                Text(subtitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, ),),

              ],
            )
          ],
        ),

      ),

    );
  }
}
