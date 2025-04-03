import 'package:flutter/material.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/utils/scaling_utility.dart';

class DropDownOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String>? items;
  final ScalingUtility scale;
  final VoidCallback? onTap;
  final void Function(String)? onItemTap;
  final bool drop;

  const DropDownOptions({
    super.key,
    required this.icon,
    required this.title,
    this.items,
    required this.scale,
    this.onTap,
    this.onItemTap,
    this.drop = true,
  });

  @override
  Widget build(BuildContext context) {
    final isItemsAvailable = items != null && items!.isNotEmpty;

    return ExpansionTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
      showTrailingIcon: drop == false ? false : true,
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
      collapsedShape: const Border(
        bottom: BorderSide(
          color: Colors.white30,
        ),
      ),
      shape: const Border(
        bottom: BorderSide(
          color: Colors.white30,
        ),
      ),
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
                    left: scale.getScaledHeight(60),
                    bottom: scale.getScaledHeight(8),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (onItemTap != null) {
                        onItemTap!(item);
                      }
                    },
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 2,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: scale.getScaledHeight(8),
                          ),
                          Text(
                            item,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: scale.getScaledHeight(12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList()
          : [],
    );
  }
}
