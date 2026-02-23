import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../gen/assets.gen.dart';
import '../theme/color_pallete.dart';

class CustomTextFromField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextFromField({
    super.key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  bool _isPasswordVisibl = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: ColorPallete.generalTextColor,
      ),
      controller: widget.controller,
      cursorColor: ColorPallete.bordarColor,
      validator: widget.validator,
      obscureText: widget.isPassword ? _isPasswordVisibl : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorPallete.bordarColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.bordarColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.bordarColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.bordarColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.errorBordarColor),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? Bounceable(
                onTap: () {
                  setState(() {
                    _isPasswordVisibl = !_isPasswordVisibl;
                  });
                },
                child: Icon(
                  _isPasswordVisibl
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: Color(0xFFFFFFFF),
                ),
              )
            : null,
      ),
    );
  }
}
