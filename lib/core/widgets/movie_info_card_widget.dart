import 'package:flutter/material.dart';

import '../theme/color_pallete.dart';

class MovieInfoCardWidget extends StatelessWidget {
  final dynamic iconAsset;
  final String label;

  const MovieInfoCardWidget({
    super.key,
    required this.iconAsset,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorPallete.bordarColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconAsset.svg(width: 23.0, height: 23.0),
            SizedBox(width: 10),
            Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: "Roboto",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
