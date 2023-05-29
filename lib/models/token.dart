class Token {
/*
{
  "text": "(",
  "type": "T__4",
  "line": 1,
  "column": 0
} 
*/

  String text;
  String? type;
  int line;
  int column;

  Token({
    required this.text,
    this.type,
    required this.line,
    required this.column,
  });

  Token.fromJson(Map<String, dynamic> json)
      : text = json['text'].toString(),
        type = json['type']?.toString(),
        line = json['line'].toInt(),
        column = json['column'].toInt();

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    data['line'] = line;
    data['column'] = column;
    return data;
  }
}
