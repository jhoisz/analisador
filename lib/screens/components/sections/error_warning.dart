import 'package:analisador/screens/components/custom_button.dart';
import 'package:analisador/theme/theme_colors.dart';
import 'package:flutter/material.dart';

import '../box_card.dart';

class ErrorWarning extends StatelessWidget {
  const ErrorWarning({super.key, required this.changeErrorState});
  final Function() changeErrorState;

  @override
  Widget build(BuildContext context) {
    return BoxCard(
      myChild: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/erro.png',
              fit: BoxFit.contain,
              scale: 6.0,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Ops...\nOcorreu um erro, tente selecionar um arquivo com extensão txt',
                textAlign: TextAlign.center,
              ),
            ),
            CustomButton(
              text: 'Tentar novamente',
              function: changeErrorState,
              color: ThemeColors.error,
            ),
          ],
        ),
      ),
    );
  }
}
