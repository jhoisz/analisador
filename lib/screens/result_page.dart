import 'package:analisador/screens/components/custom_button.dart';
import 'package:analisador/screens/components/custom_card.dart';
import 'package:analisador/theme/theme_colors.dart';
import 'package:flutter/material.dart';

import '../models/token.dart';

// ini: (  TIPO_DE_VAGA |
//         CONHECIMENTOS |
//         MODALIDADE |
//         BENEFICIOS |
//         SENIORIDADE |
//         SALARIO |
//         AREA |
//         FRAMEWORKS_BACKEND |
//         FRAMEWORKS_FRONTEND |
//         FRAMEWORKS_MOBILE |
//         SOFTSKILLS |
//         LINGUAGENS |
//         Space |
//         PALAVRA |
//         ESPECIAIS |
//         NUMEROS
//         )*;

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<Token>?;

    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: Padding(
        padding: const EdgeInsets.all(44.0),
        child: Column(
          children: [
            const _TitleRichText(),
            CustomCard(
              widget: args != null && args.isNotEmpty
                  ? ListView(
                      children: [
                        Wrap(
                          children: args
                              .map((e) => TokenCard(
                                    token: e.text,
                                    color: e.type != null
                                        ? ThemeColors.tokenTypes[e.type]!
                                        : ThemeColors.baseColor,
                                  ))
                              .toList(),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.not_interested_rounded),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Center(
                            child: Text('Lista de tokens vazia'),
                          ),
                        ),
                      ],
                    ),
            ),
            CustomButton(
              text: 'Tentar novamente',
              function: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              color: ThemeColors.baseColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleRichText extends StatelessWidget {
  const _TitleRichText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Tokens',
          style: Theme.of(context).textTheme.titleMedium,
          children: const [
            TextSpan(
              text: ' analisados',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w100,
                color: ThemeColors.baseColor,
              ),
            ),
          ]),
    );
  }
}

class TokenCard extends StatelessWidget {
  const TokenCard({super.key, required this.token, required this.color});
  final String token;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Text(token, style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}
