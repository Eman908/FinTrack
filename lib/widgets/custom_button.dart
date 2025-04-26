import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.iconData,
    this.onPressed,
    required this.iconColor,
  });
  final Color color;
  final IconData iconData;
  final void Function()? onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Icon(iconData, color: iconColor),
      ),
    );
  }
}
