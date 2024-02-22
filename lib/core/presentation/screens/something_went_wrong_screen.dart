import 'package:flutter/material.dart';

class SomethingWentwrongScreen extends StatelessWidget {
  const SomethingWentwrongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          "Sometthing went wrong!",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
