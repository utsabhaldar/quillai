import 'dart:io';

import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/presentation/sign_up_screen/controller/sign_up_controller.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/common_network_image.dart';
import 'package:quillai/widgets/custom_text_field.dart';
import 'package:quillai/widgets/divider_with_text.dart';
import 'package:quillai/widgets/social_button.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Scaffold(
        backgroundColor: ColorConstant.color1,
        body: BackgroundEffect(dynamicChildren: [
          Center(
            child: Opacity(
              opacity: 0.8,
              child: CommonNetworkImageView(
                url: ImageConstants.bgImage,
                height: scale.fh * 0.96,
                width: scale.fw * 0.96,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: scale.getScaledHeight(100)),
              // CommonNetworkImageView(
              //   url: ImageConstants.quillai,
              //   height: scale.getScaledHeight(40),
              //   width: scale.getScaledHeight(82),
              // ),
              Center(
                child: Container(
                  height: 28,
                  width: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: const Color(0xFF3f86bd)),
                  child: const Center(
                    child: Text(
                      'Image 2',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: scale.getScaledHeight(30)),
              Text(
                "Sign Up".tr,
                style: AppStyle.style3.copyWith(
                  fontSize: scale.getScaledHeight(22),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: scale.getScaledHeight(20)),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: scale.getPadding(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: scale.getScaledHeight(10)),
                        GestureDetector(
                          onTap: () {
                            controller.signInWithGoogle();
                          },
                          child: SocialButton(
                            image: Image.asset(ImageConstants.google),
                            text: 'Continue with Google'.tr,
                          ),
                        ),
                        SizedBox(height: scale.getScaledHeight(10)),
                        Platform.isAndroid
                            ? const SizedBox.shrink()
                            : GestureDetector(
                                onTap: () {
                                  controller.signInWithApple();
                                },
                                child: SocialButton(
                                  image: Image.asset(ImageConstants.apple),
                                  text: 'Continue with Apple'.tr,
                                ),
                              ),
                        SizedBox(height: scale.getScaledHeight(20)),
                        DividerWithText(text: 'OR'.tr),
                        SizedBox(height: scale.getScaledHeight(20)),
                        CustomTextField(
                          hintText: 'Email'.tr,
                          onChanged: (value) => controller.email.value = value,
                        ),
                        SizedBox(height: scale.getScaledHeight(10)),
                        CustomTextField(
                          hintText: 'Password'.tr,
                          isPassword: true,
                          onChanged: (value) =>
                              controller.password.value = value,
                        ),
                        SizedBox(height: scale.getScaledHeight(10)),
                        CustomTextField(
                          hintText: 'Confirm Password'.tr,
                          isPassword: true,
                          onChanged: (value) =>
                              controller.confirmPassword.value = value,
                        ),
                        SizedBox(height: scale.getScaledHeight(10)),
                        SizedBox(
                          width: scale.getScaledHeight(scale.fw),
                          height: scale.getScaledHeight(50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) =>
                                      controller.toggleRememberMe(),
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "By continuing you, agree to our ".tr,
                                  style: AppStyle.style2.copyWith(
                                    color: Colors.white38,
                                    fontSize: 10,
                                    letterSpacing: 0.5,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Terms".tr,
                                      style: AppStyle.style3.copyWith(
                                        color: Colors.red,
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                        letterSpacing: 0.5,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(AppRoutes
                                              .termsAndConditionsScreen);
                                        },
                                    ),
                                    TextSpan(
                                      text: " and ".tr,
                                      style: AppStyle.style2.copyWith(
                                        color: Colors.white38,
                                        fontSize: 10,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Privacy Policy".tr,
                                      style: AppStyle.style3.copyWith(
                                        color: Colors.red,
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                        letterSpacing: 0.5,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(
                                              AppRoutes.privacyPolicyScreen);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: scale.getScaledHeight(20)),
                        ElevatedButton(
                          onPressed: () {
                            controller.signUp();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.color4,
                            fixedSize: Size(
                                scale.fh - scale.getScaledHeight(100),
                                scale.getScaledHeight(60)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(scale.getScaledHeight(12)),
                              ),
                            ),
                          ),
                          child: Text(
                            'Sign Up'.tr,
                            style: AppStyle.style3.copyWith(
                              fontSize: scale.getScaledHeight(20),
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.color1,
                            ),
                          ),
                        ),
                        SizedBox(height: scale.getScaledHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?  ".tr,
                              style: AppStyle.style2.copyWith(
                                fontSize: scale.getScaledHeight(12),
                                fontWeight: FontWeight.normal,
                                color: Colors.white54,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.signInScreen,
                                );
                              },
                              child: Text(
                                "| Sign In".tr,
                                style: AppStyle.style2.copyWith(
                                  fontSize: scale.getScaledHeight(12),
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: scale.getScaledHeight(100)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
