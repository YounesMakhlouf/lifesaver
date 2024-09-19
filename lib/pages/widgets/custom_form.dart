import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> fields;
  final VoidCallback onSubmit;
  final String submitButtonText;

  const CustomForm({
    super.key,
    required this.formKey,
    required this.fields,
    required this.onSubmit,
    required this.submitButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ...fields.map((field) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: field,
              )),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text(submitButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
