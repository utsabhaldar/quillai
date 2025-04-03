import 'package:flutter/material.dart';
import 'package:quillai/constants/color_constants.dart';

class HintTextWidget extends StatelessWidget {
  final String text;
  final Widget content;

  const HintTextWidget({
    super.key,
    required this.text,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: content,
        ),
        Positioned(
          top: 0,
          left: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            color: ColorConstant.color1,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
