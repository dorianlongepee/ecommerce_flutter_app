import 'package:flutter/material.dart';

import '../constants.dart';

class InputComponent extends StatelessWidget {
  const InputComponent({
    super.key, required this.label, required this.stringSetter,
  });

  final String label;
  final void Function(String value) stringSetter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding/4),
      child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
          ),
          onSaved: (newValue) => stringSetter(newValue ?? '')
      ),
    );
  }
}