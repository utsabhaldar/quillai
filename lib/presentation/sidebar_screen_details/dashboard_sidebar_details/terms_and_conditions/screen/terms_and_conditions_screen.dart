import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/terms_and_conditions/controller/terms_and_conditions_controller.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/common_network_image.dart';
import 'package:quillai/widgets/drop_down_text.dart';

class TermsAndConditionsScreen extends GetWidget<TermsAndConditionsController> {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Scaffold(
      backgroundColor: ColorConstant.color1,
      body: BackgroundEffect(
        dynamicChildren: [
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: scale.getScaledHeight(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: scale.getScaledHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: scale.getScaledHeight(10)),
                    ],
                  ),
                  SizedBox(height: scale.getScaledHeight(10)),
                  CommonNetworkImageView(
                    url: ImageConstants.quillai,
                    height: scale.getScaledHeight(40),
                    width: scale.getScaledHeight(82),
                  ),
                  SizedBox(height: scale.getScaledHeight(30)),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scale.getScaledHeight(16)),
                          child: Text(
                            "Terms and Conditions for X'orbx Cyber Security.",
                            style: AppStyle.style3.copyWith(
                              color: Colors.white,
                              fontSize: scale.getScaledHeight(14),
                            ),
                          ),
                        ),
                        SizedBox(height: scale.getScaledHeight(16)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: scale.getScaledHeight(16)),
                          child: Text(
                            "Effective Date: 01/11/2024\nWelcome to X'orbx Cyber Security. By accessing or using our services, website, or products (collectively, the \"Services\"), you agree to comply with and be bound by these Terms and Conditions (the \"Terms\"). If you do not agree with these Terms, please do not use our Services.",
                            style: AppStyle.style3.copyWith(
                              color: Colors.white,
                              fontSize: scale.getScaledHeight(14),
                            ),
                          ),
                        ),
                        DropDownText(
                          title: "1. Acceptance of Terms",
                          items: const [
                            'By using our Services, you confirm that you are at least 18 years old, or if you are under 18, that you have obtained parental or guardian consent to use our Services. You also represent that you have the legal capacity to enter into these Terms.'
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "2. Changes to Terms",
                          items: const [
                            "We reserve the right to modify these Terms at any time. Any changes will be effective immediately upon posting on our website. Your continued use of the Services following any changes constitutes your acceptance of the revised Terms. Please review these Terms regularly to stay informed of updates."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "3. Services Provided",
                          items: const [
                            "X'orbx Cyber Security provides cybersecurity services, including but not limited to threat assessment, security audits, incident response, and related consulting services. Specific services and products may be subject to additional terms and conditions."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "4. User Responsibilities",
                          items: const [
                            "You agree to use the Services only for lawful purposes and in accordance with these Terms. You will not:\n• Use the Services in any manner that violates any applicable federal, state, local, or international law or regulation.\n• Impersonate or attempt to impersonate X'orbx Cyber Security, an employee, another user, or any other person or entity.\n• Transmit any material that is unlawful, fraudulent, defamatory, obscene, or otherwise objectionable.\n• Introduce any viruses, Trojan horses, worms, or other harmful code or malware."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "5. Account Security",
                          items: const [
                            "If you create an account with us, you are responsible for maintaining the confidentiality of your account credentials and for restricting access to your computer or device. You agree to accept responsibility for all activities that occur under your account. If you suspect any unauthorized use of your account, you must notify us immediately.."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "6. Payment Terms",
                          items: const [
                            "All fees for our Services are due as specified in your order or agreement. Payments must be made in full at the time of purchase unless otherwise agreed upon. Late payments may incur additional fees, and we reserve the right to suspend or terminate your access to the Services in case of non-payment."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "7. Intellectual Property Rights",
                          items: const [
                            "All content, trademarks, and other intellectual property on our website and in our Services are owned by X'orbx Cyber Security or our licensors. You may not reproduce, distribute, modify, or create derivative works from any content without our prior written permission."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "8. Limitation of Liability",
                          items: const [
                            "To the fullest extent permitted by law, X'orbx Cyber Security shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages, including but not limited to loss of profits, data, use, goodwill, or other intangible losses, resulting from:\n• Your access to or use of (or inability to access or use) our Services.\n• Any conduct or content of any third party on the Services.\n• Any content obtained from the Services.\n• Unauthorized access, use, or alteration of your transmissions or content."
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "9. Indemnification",
                          items: const [
                            'You agree to defend, indemnify, and hold harmless X\'orbx Cyber Security, its affiliates, and their respective officers, directors, employees, and agents from any claims, liabilities, damages, losses, costs, and expenses (including reasonable attorneys’ fees) arising out of or in connection with your use of the Services, your violation of these Terms, or your infringement of any intellectual property or other rights of any person or entity.'
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "10. Governing Law",
                          items: const [
                            'These Terms shall be governed by and construed in accordance with the laws of Ontario, Canada You agree to submit to the personal jurisdiction of the courts located within Ontario Canada for the resolution of any disputes.'
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "11. Termination",
                          items: const [
                            'We reserve the right to terminate or suspend your access to our Services, without prior notice or liability, for any reason whatsoever, including but not limited to a breach of these Terms.'
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "12. Entire Agreement",
                          items: const [
                            'These Terms constitute the entire agreement between you and X\'orbx Cyber Security regarding your use of the Services and supersede any prior agreements between you and X\'orbx Cyber Security.'
                          ],
                          scale: scale,
                        ),
                        DropDownText(
                          title: "13. Contact Information",
                          items: const [
                            'If you have any questions about these Terms, please contact us at:\n\nX\'orbx Cyber Security\nLegal@quillai.con\n130 King St W, Toronto, ON M5X 2A2, Canada'
                          ],
                          scale: scale,
                        ),
                        SizedBox(height: scale.getScaledHeight(50)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
