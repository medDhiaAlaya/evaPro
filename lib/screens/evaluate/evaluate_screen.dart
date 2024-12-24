import 'package:flutter/material.dart';

class EvaluateScreen extends StatelessWidget {
  const EvaluateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluate"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Welcome to Evaluate Screen"),
          ],
        ),
      ),
    );
  }
}