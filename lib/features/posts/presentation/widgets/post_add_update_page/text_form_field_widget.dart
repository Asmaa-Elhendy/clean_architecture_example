import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool minLines;
  const TextFormFieldWidget({required this.hintText,required this.controller,required this.minLines,super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: controller,
        minLines: minLines?2:1,
        maxLines: 6,
        validator: (val) =>
        val!.isEmpty ? "${hintText} cannot be empty" : null,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
