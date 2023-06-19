//firebase connected
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:more_practice/Screens/welcomeScreen.dart';
import 'package:more_practice/pages/Home/home_Page.dart';
import 'package:more_practice/pages/auth_pass/firebaseAuth/signup_Exception.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => WelcomeScreen()): Get.offAll(() => HomePage());
  }

  //signup with email and password
  void createUserWithEmailAndPassword(String email, String password) async{
   try{
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
     firebaseUser.value != null ? Get.offAll(HomePage()): Get.to(WelcomeScreen());
   } on FirebaseAuthException catch(e){

     final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
     print('Firebase Auth Exception - ${ex.message}');
     throw ex;
   }catch(_){
      final ex = SignUpWithEmailAndPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
   }

  }

  //for login
void loginWithEmailAndPassword(String email, String password) async{

  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch(e){

  }catch(_){}
}

//logout
void logout() async => await _auth.signOut();
}
