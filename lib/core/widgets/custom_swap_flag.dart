import 'package:flutter/material.dart';

import '../theme/color_pallete.dart';

class CustomSwapFlag extends StatefulWidget {
  const CustomSwapFlag({super.key});

  @override
  State<CustomSwapFlag> createState() => _CustomSwapFlagState();
}

class _CustomSwapFlagState extends State<CustomSwapFlag> {
  String leftImage = 'assets/images/LR.png';
  String rightImage = 'assets/images/EG.png';


  String? selectedImage;

  void swapImages() {
    setState(() {
      final temp = leftImage;
      leftImage = rightImage;
      rightImage = temp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorPallete.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImage = rightImage;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedImage == rightImage
                        ? ColorPallete.primaryColor
                        : Colors.transparent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    leftImage,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImage = leftImage;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedImage == leftImage
                        ? ColorPallete.primaryColor
                        : Colors.transparent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    rightImage,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
