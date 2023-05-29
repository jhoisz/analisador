import 'package:analisador/screens/components/custom_button.dart';
import 'package:analisador/screens/components/custom_card.dart';
import 'package:flutter/material.dart';

import '../models/token.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<Token>?;

    return Scaffold(
      backgroundColor: const Color(0xFFD5E7F2),
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
                                    color: Colors.blue,
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
              color: const Color(0xFF077F8C),
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
                color: Color(0xFF077F8C),
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
