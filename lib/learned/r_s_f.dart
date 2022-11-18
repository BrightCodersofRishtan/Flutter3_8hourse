// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;
  RangeSelectorForm({
    super.key, 
    required this.formKey, 
    required this.minValueSetter, 
    required this.maxValueSetter
    });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RengeSelectTextField(
              LabelText: 'Minimum',
              IntValueSetter:minValueSetter,
              ),
            const SizedBox(height: 10),
            RengeSelectTextField(
              LabelText: 'Maximum',
              IntValueSetter: maxValueSetter,
              ),
          ],
        ),
      ),
    );
  }
}

class RengeSelectTextField extends StatelessWidget {
  final String LabelText;
  // this is method
  intValueSetter(int parse) {}
  const RengeSelectTextField({
    Key? key,
    required IntValueSetter IntValueSetter,
    required this.LabelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(LabelText),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be Integre";
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? "")),
    );
  }
}
