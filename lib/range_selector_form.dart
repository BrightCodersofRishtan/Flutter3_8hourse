import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

// f-nyani parametr sifatida ishlatish uchun typedef used
class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;
  const RangeSelectorForm(
      {super.key,
      required this.formKey,
      required this.minValueSetter,
      required this.maxValueSetter});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(    
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextForm(
              LabelText: 'Minimum',
              intValueSetter: minValueSetter,
            ),
            const SizedBox(height: 10),
            RangeSelectorTextForm(
              LabelText: 'Maximum',
              intValueSetter: maxValueSetter,
            )
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextForm extends StatelessWidget {
  final String LabelText;
  final IntValueSetter intValueSetter;

  const RangeSelectorTextForm({
    Key? key,
    required this.LabelText,
    required this.intValueSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          // this is will be change so we call a variable
          labelText: LabelText),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        } else {
          return null;
        }
      },
      onSaved: ((newValue) => intValueSetter(int.parse(newValue ?? ""))),
    );
  }
}
