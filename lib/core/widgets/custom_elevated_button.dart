import 'package:flutter/material.dart';
import '../theme/color_pallete.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? bottonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? bordarColor;
  final Widget? customChild;
  final Color? textColor;
  final VoidCallback? onNavigation;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.bottonText,
    this.backgroundColor,
    this.bordarColor,
    this.customChild,
    this.textColor,
    this.onNavigation,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed:
          onPressed ??
          () {
            if (onPressed != null) {
              onPressed!();
            }

            if (onNavigation != null) {
              onNavigation!();
            }
          },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? ColorPallete.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: bordarColor ?? ColorPallete.primaryColor),
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child:
          customChild ??
          Text(
            bottonText ?? "",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              color: textColor ?? ColorPallete.colorBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
    );
  }
}
