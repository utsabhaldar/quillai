import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print("Some error Occured");
    }
    return null;
  }

  Future<UserCredential?> loginWithApple() async {
    try {
      final cred = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      return await _auth.signInWithCredential(cred as AuthCredential);
    } catch (e) {
      print("Some error Occured");
    }
    return null;
  }

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    String confirmPassword,
    bool rememberMe,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error Occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, bool rememberMe) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error Occured");
    }
    return null;
  }
}
