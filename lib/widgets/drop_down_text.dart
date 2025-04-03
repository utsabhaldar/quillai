import 'package:flutter/material.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/utils/scaling_utility.dart';

class DropDownText extends StatelessWidget {
  final String title;
  final List<String>? items;
  final ScalingUtility scale;
  final VoidCallback? onTap;

  const DropDownText({
    super.key,
    required this.title,
    this.items,
    required this.scale,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isItemsAvailable = items != null && items!.isNotEmpty;

    return ExpansionTile(
      title: Text(
        title,
        style: AppStyle.style3.copyWith(
          color: Colors.white,
          fontSize: scale.getScaledHeight(14),
        ),
      ),
      backgroundColor: Colors.transparent,
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      collapsedShape: const Border(),
      shape: const Border(),
      onExpansionChanged: (isExpanded) {
        if (!isItemsAvailable && isExpanded) {
          onTap?.call();
        }
      },
      children: isItemsAvailable
          ? items!
              .map(
                (item) => Padding(
                  padding: EdgeInsets.only(
                    left: scale.getScaledHeight(16),
                    bottom: scale.getScaledHeight(16),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: scale.getScaledHeight(12),
                    ),
                  ),
                ),
              )
              .toList()
          : [],
    );
  }
}
