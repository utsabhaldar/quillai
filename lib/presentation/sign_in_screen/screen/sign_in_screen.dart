import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/presentation/sign_in_screen/controller/sign_in_controller.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/common_network_image.dart';
import 'package:quillai/widgets/custom_text_field.dart';
import 'package:quillai/widgets/divider_with_text.dart';
import 'package:quillai/widgets/social_button.dart';

class SignInScreen extends GetWidget<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Scaffold(
      backgroundColor: ColorConstant.color1,
      body: BackgroundEffect(
        dynamicChildren: [
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
              CommonNetworkImageView(
                url: ImageConstants.quillai,
                height: scale.getScaledHeight(40),
                width: scale.getScaledHeight(82),
              ),
              SizedBox(height: scale.getScaledHeight(30)),
              Text(
                "Sign In".tr,
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
                            text: "Continue with Google".tr,
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
                                  text: 'Continue with Apple',
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
                        SizedBox(
                          width: scale.getScaledHeight(scale.fw),
                          height: scale.getScaledHeight(50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                  Text(
                                    "Remember me".tr,
                                    style: AppStyle.style2.copyWith(
                                      fontSize: scale.getScaledHeight(12),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => controller.passwordReset(
                                    controller.email.value.trim()),
                                child: Text(
                                  "Forgot Password?".tr,
                                  style: AppStyle.style2.copyWith(
                                    fontSize: scale.getScaledHeight(12),
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: scale.getScaledHeight(20)),
                        ElevatedButton(
                          onPressed: () {
                            controller.signIn();
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
                            'Sign In'.tr,
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
                              "Don't have an account?  | ".tr,
                              style: AppStyle.style2.copyWith(
                                fontSize: scale.getScaledHeight(12),
                                fontWeight: FontWeight.normal,
                                color: Colors.white54,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.signUpScreen,
                                );
                                controller.initialCountryCode.value =
                                    controller.toString();
                              },
                              child: Text(
                                "Sign Up".tr,
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
        ],
      ),
    );
  }
}
