import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/routes/app_routes.dart';

class VerificationController extends GetxController {
  var otp = ''.obs;
  var email = ''.obs;
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

  void verifyOTP() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.snackbar(
          "Error",
          "No user is currently signed in.",
          colorText: Colors.red,
        );
        return;
      }

      if (user.emailVerified) {
        Get.snackbar(
          "Success",
          "OTP verification successful. Email verified.",
          colorText: Colors.white,
        );
        Get.toNamed(AppRoutes.multiFactorAuthenticationScreen);
      } else {
        Get.snackbar(
          "Error",
          "OTP verification failed. Please check your email and try again.",
          colorText: Colors.red,
        );
      }
    } catch (e) {
      print("Error while verifying OTP: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred while verifying OTP.",
        colorText: Colors.red,
      );
    }
  }

  void resendCode() async {
    var res = await emailAuth.sendOtp(recipientMail: email.value, otpLength: 4);
    if (res) {
      Get.snackbar(
        "Success",
        "OTP sent",
        colorText: Colors.white,
      );
    }
  }
}
