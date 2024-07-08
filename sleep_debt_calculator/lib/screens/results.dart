import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({super.key, required this.results});
  final String results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Weekly sleep debt : $results hours'
        ),
      ),
    );
  }
}