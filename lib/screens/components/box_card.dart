import 'package:analisador/theme/theme_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({
    super.key,
    required this.myChild,
  });

  final Widget myChild;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: ThemeColors.shadow,
            blurRadius: 4,
            offset: Offset(0, 3), // changes posit
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DottedBorder(
          color: ThemeColors.baseColor,
          strokeWidth: 1,
          borderType: BorderType.Rect,
          child: myChild,
        ),
      ),
    );
  }
}
