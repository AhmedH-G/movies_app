import 'package:flutter/material.dart';
import '../../core/theme/color_pallete.dart';

class CustomFilmCard extends StatelessWidget {
  final String rating;
  final String imageUrl;

  const CustomFilmCard({
    super.key,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorPallete.colorBlack.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(rating, style: theme.textTheme.titleSmall),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: ColorPallete.ratingColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
