import 'package:flutter/material.dart';
import 'package:foundation_app/range_selector_page.dart';



void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Randomizer",
      home: RangeSelectorPage(),
    );
  }
}
