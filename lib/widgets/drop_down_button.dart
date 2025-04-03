import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/presentation/sign_up_screen/controller/sign_up_controller.dart';

class DropDownButton extends StatelessWidget {
  // Declare the controller to access its properties
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: controller.selectedLanguage.value,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1A3A5A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white70),
        ),
      ),
      dropdownColor: const Color(0xFF1A3A5A),
      style: const TextStyle(color: Colors.white),
      items:
          ['English', 'Spanish', 'French', 'German', 'Chinese'].map((language) {
        return DropdownMenuItem(
          value: language,
          child: Text(language),
        );
      }).toList(),
      onChanged: (value) {
        controller.selectedLanguage.value = value!;
      },
    );
  }
}
