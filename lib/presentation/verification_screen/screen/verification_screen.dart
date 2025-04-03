import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/verification_screen/controller/verification_controller.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/common_network_image.dart';

class VerificationScreen extends GetWidget<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.color1,
        body: BackgroundEffect(dynamicChildren: [
          SizedBox(
            height: scale.fh,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: scale.getScaledHeight(30)),
                  child: Column(
                    children: [
                      SizedBox(height: scale.getScaledHeight(100)),
                      CommonNetworkImageView(
                        url: ImageConstants.quillai,
                        height: scale.getScaledHeight(40),
                        width: scale.getScaledHeight(82),
                      ),
                      SizedBox(height: scale.getScaledHeight(30)),
                      Text(
                        "Verification",
                        style: AppStyle.style2.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: scale.getScaledHeight(50)),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        textStyle: AppStyle.style1,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12),
                          fieldHeight: scale.getScaledHeight(58),
                          fieldWidth: scale.getScaledWidth(56),
                          activeFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          selectedColor: Colors.white60,
                          activeColor: Colors.white60,
                          inactiveColor: Colors.white60,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          controller.otp.value = value;
                        },
                      ),
                      SizedBox(height: scale.getScaledHeight(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive code?  ",
                            style: AppStyle.style2.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white54,
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.resendCode,
                            child: Text(
                              "Request Again",
                              style: AppStyle.style2.copyWith(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: scale.getScaledHeight(150)),
                      ElevatedButton(
                        onPressed: controller.verifyOTP,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.color4,
                          fixedSize:
                              Size(scale.fh - 100, scale.getScaledHeight(60)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                scale.getScaledHeight(12)),
                          ),
                        ),
                        child: Text(
                          'Verify',
                          style: AppStyle.style3.copyWith(
                            fontSize: 20,
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
                            "Create Account  |  ",
                            style: AppStyle.style2.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.signUpScreen,
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: AppStyle.style2.copyWith(
                                fontSize: 12,
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
          ),
        ]));
  }
}
