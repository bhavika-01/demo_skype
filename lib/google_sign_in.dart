import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_app/first.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //await FirebaseAuth.instance.signInWithCredential(credential);
    //notifyListeners();
    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // ignore: unused_local_variable
    User? user = result.user;
    notifyListeners();

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    }
    // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}

   


   // Here signInWithGoogle() is your defined function!
  