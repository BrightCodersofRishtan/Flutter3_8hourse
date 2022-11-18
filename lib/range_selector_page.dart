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
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        maxValueSetter: (int value) => _min = value,
        minValueSetter: (int value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: () {
          //TODO: Validate the Form
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            //TODO: Navigate to the generator page
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
