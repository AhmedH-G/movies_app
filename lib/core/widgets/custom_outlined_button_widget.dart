import 'package:flutter/material.dart';
import '../../../core/theme/color_pallete.dart';

class CustomOutlinedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomOutlinedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: ColorPallete.primaryColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: ColorPallete.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
