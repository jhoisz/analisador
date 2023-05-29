import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/token.dart';

class AnalyzerApi {
  final dio = Dio();
  final url = 'projeto-compiladores.vercel.app';
  final analyzerPostRoute = '/analisador';

  //text: "(c1+1)b*3a"
  Future<List<Token>> getTokens(String text) async {
    final response = await http.post(
      Uri.https(url, analyzerPostRoute),
      body: {"input": text},
    );
    final json = jsonDecode(response.body);

    // print(json['tokens']['recognizedTokens']);
    final recognizedTokens = List<Token>.from(
      json['tokens']['recognizedTokens'].map((element) {
        return Token.fromJson(element);
      }),
    );

    final nonRecognizedTokens = List<Token>.from(
      json['tokens']['nonRecognizedTokens'].map((element) {
        return Token.fromJson(element);
      }),
    );
    return (recognizedTokens + nonRecognizedTokens);
  }
}
