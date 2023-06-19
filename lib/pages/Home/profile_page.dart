import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:more_practice/pages/auth_pass/change_pass/change_pass.dart';
import 'package:more_practice/theme/colors.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Container(
                padding: Tpadding,

              child: Column(
                children: [

                  SizedBox(height: 30,),
                  SizedBox(
                      height: 120,
                    width: 120,

                    child: ClipRRect(
                     borderRadius: BorderRadius.circular(100),
                       child: Image(image: AssetImage(profileImage),)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(pName, style: style,),
                  Text(pEmail, style: TextStyle(color: Colors.grey.shade800, fontSize: 18),),
                  const SizedBox(height: 20,),

                  //edit profile
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: (){},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, side: BorderSide.none, shape: StadiumBorder(),

                      ),
                        child: Text('Edit Profile'),),
                  ),

                  const SizedBox(height: 30,),
                  const Divider(),
                  const SizedBox(height: 10,),

                  ProfileMenuWidget(title: 'Setting', icon: LineAwesomeIcons.cog, onPress: (){}, textColor: null, endIcon: true),

                  //change password
                  ProfileMenuWidget(title: 'Change Password', icon: LineAwesomeIcons.fingerprint, onPress: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChangePassword(),),);
                  }, textColor: null, endIcon: true),

                  const SizedBox(height: 5,),
                  const Divider(),

                  ProfileMenuWidget(title: 'Log Out', icon: LineAwesomeIcons.alternate_sign_out, onPress: (){}, textColor: secondaryColor, endIcon: true),
                  // ProfileMenuWidget(),
                  // ProfileMenuWidget(),
                ],
              ),
            ),
          ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color ? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      onTap:  onPress,

      leading: Container(
        
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: primaryColor.withOpacity(0.1),
        ),
        
        child: Icon(icon, color: primaryColor,),
        
      ),
      title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade800)?.apply(color: textColor),),

      trailing: endIcon ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: primaryColor.withOpacity(0.1),
        ),

        child: Icon(LineAwesomeIcons.angle_right, color: primaryColor,),
      ): null,

    );
  }
}
