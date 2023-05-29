import 'package:analisador/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../box_card.dart';

class SelectFile extends StatelessWidget {
  const SelectFile({super.key, required this.selectFile});
  final Function() selectFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectFile,
      borderRadius: BorderRadius.circular(20),
      child: BoxCard(
        myChild: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/arquivo.png',
                fit: BoxFit.contain,
                scale: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: _SelectButton(selectFile: selectFile),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Selecione um arquivo do tipo .txt para fazer a análise sintática',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectButton extends StatelessWidget {
  const _SelectButton({required this.selectFile});
  final Function() selectFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectFile,
      child: Ink(
        height: 48.0,
        width: 240.0,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: ThemeColors.buttonSelect,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FaIcon(
              FontAwesomeIcons.arrowUpFromBracket,
              size: 16.0,
              color: ThemeColors.contentButton,
            ),
            Text(
              'ESCOLHER ARQUIVO',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
