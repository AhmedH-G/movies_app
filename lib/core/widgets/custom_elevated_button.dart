
import 'package:flutter/material.dart';

import '../theme/color_pallete.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? bottonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? bordarColor;
  final Widget? customChild;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.bottonText,
    this.backgroundColor,
    this.bordarColor,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? ColorPallete.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: bordarColor ?? ColorPallete.primaryColor),
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child:
          customChild ??
          Text(
            bottonText ?? "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
    );
  }
}
