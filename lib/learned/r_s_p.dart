import 'package:flutter/material.dart';
import 'package:foundation_app/randomizer_page.dart';
import 'package:foundation_app/range_selector_form.dart';


class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Lessons")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RangeSelectorForm(
          formKey: formKey,
          minValueSetter: (int value) => _min = value,
          maxValueSetter: (int value) => _max = value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(
                  min: _min,
                  max: _max,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
