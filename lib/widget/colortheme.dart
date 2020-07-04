import 'package:flutter/material.dart';

class Themetht extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.orange[400],
        Colors.orange[600],
        Colors.orange[900],
      ])),
    );
  }
}
