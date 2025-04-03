import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/firebase_auth/firebase_auth_service.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/widgets/successful_sign_up.dart';

class SignUpController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var rememberMe = false.obs;

  final FirebaseAuthService _auth = FirebaseAuthService();
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");
  EmailOTP myauth = EmailOTP();

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void signInWithGoogle() async {
    try {
      UserCredential? user = await _auth.loginWithGoogle();
      Get.toNamed(
        AppRoutes.multiFactorAuthenticationScreen,
      );
      if (user != null) {
        print("Logged in as ${user.user?.displayName}");
        Get.snackbar(
          "Success",
          "Logged in as ${user.user?.displayName}",
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error during sign-up: $e");
    }
  }

  void signInWithApple() async {
    try {
      UserCredential? user = await _auth.loginWithApple();
      Get.toNamed(
        AppRoutes.multiFactorAuthenticationScreen,
      );
      if (user != null) {
        print("Logged in as ${user.user?.displayName}");
        Get.snackbar(
          "Success",
          "Logged in as ${user.user?.displayName}",
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error during sign-up: $e");
    }
  }

  void signUp() async {
    if (await _validateForm()) {
      try {
        User? user = await _auth.signUpWithEmailAndPassword(
          email.value.trim(),
          password.value.trim(),
          confirmPassword.value.trim(),
          rememberMe.value,
        );
        sendOTPTOMail();
        // Get.toNamed(
        //   AppRoutes.signInScreen,
        // );
        if (user != null) {
          Get.dialog(successfulSignUp(title: "Registration was successful!"));
          print("Sign-up successful: ${user.email}");
          Get.snackbar(
            "Success",
            "Sign-up successful: ${user.email}",
            colorText: Colors.white,
          );
        }
      } catch (e) {
        print("Error during sign-up: $e");
      }
    } else {
      print("Form is not valid");
    }
  }

  void sendOTPTOMail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.snackbar(
          "Error",
          "This account already exists or wrong email",
          colorText: Colors.red,
        );
        Get.toNamed(AppRoutes.signUpScreen);
        return;
      }

      await user.sendEmailVerification();

      Get.toNamed(AppRoutes.signInScreen);

      Get.snackbar(
        "Success",
        "Verification email sent to $email",
        colorText: Colors.white,
      );
    } catch (e) {
      print("Error while sending email: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred while sending email.",
        colorText: Colors.red,
      );
    }
  }

  Future<bool> _validateForm() async {
    if (email.value.trim().isEmpty || !email.value.contains('@')) {
      print("Error: A valid email address is required.");
      Get.snackbar(
        "Error",
        "A valid email address is required.",
        colorText: Colors.white,
      );
      return false;
    }

    if (await _isEmailAlreadyExists(email.value.trim())) {
      print("Error: This account already exists.");
      Get.snackbar(
        "Error",
        "This account already exists.",
        colorText: Colors.white,
      );
      return false;
    }

    if (password.value.trim().isEmpty || password.value.length < 8) {
      print("Error: Password must be at least 8 characters long.");
      Get.snackbar(
        "Error",
        "Password must be at least 8 characters long.",
        colorText: Colors.white,
      );
      return false;
    }

    if (confirmPassword.value.trim() != password.value.trim()) {
      print("Error: Passwords do not match.");
      Get.snackbar(
        "Error",
        "Passwords do not match.",
        colorText: Colors.white,
      );
      return false;
    }

    if (rememberMe.value == false) {
      print("Please accept the Terms and Privacy Policy");
      Get.snackbar(
        "Error",
        "Please accept the Terms and Privacy Policy",
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  bool _isEmailAlreadyExists(String email) {
    List<String> existingEmails = [];

    return existingEmails.contains(email);
  }
}
