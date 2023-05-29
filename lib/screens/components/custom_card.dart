import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(11, 107, 99, 0.25),
              blurRadius: 4,
              offset: Offset(0, 3), // changes posit
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: widget,
        ),
      ),
    );
  }
}
