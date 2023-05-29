import 'package:analisador/theme/theme_colors.dart';
import 'package:flutter/material.dart';

import '../box_card.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return BoxCard(
      myChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(
              color: ThemeColors.baseColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text('Analisando tokens...'),
          )
        ],
      ),
    );
  }
}
