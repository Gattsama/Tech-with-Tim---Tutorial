import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //sign in anon method
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      //User is a firebase class for user.
      User user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in existing user with email & password
  Future signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register new account with username & passwd
  Future registerWithEmailAndPasswd(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // create a new FireStore document for this user with the uid
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out of account
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('signout error');
      print(e.toString());
      return null;
    }
  }

  //Sign in with Google
  Future<UserCredential> singInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    final UserCredential user = await _auth.signInWithCredential(credential);
    return user;
  }
}
