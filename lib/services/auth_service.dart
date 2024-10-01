import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google SingIn
  signInWithGoogle() async {
    //begin interactive sign in procces
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtaiin auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create a new credantial for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //finaly,lets signın
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
