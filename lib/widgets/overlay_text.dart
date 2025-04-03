import 'package:flutter/material.dart';
import 'package:quillai/constants/app_style.dart';

Widget overlayText(String name, String date) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Row(
        children: [
          const Icon(
            Icons.refresh,
            size: 13,
            color: Colors.white60,
          ),
          SizedBox(width: scale.getScaledHeight(2)),
          Text(
            name,
            style: AppStyle.style2.copyWith(
                color: Colors.white60,
                fontWeight: FontWeight.normal,
                fontSize: 13),
          ),
        ],
      ),
      Text(
        date,
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 8,
        ),
      ),
    ],
  );
}
