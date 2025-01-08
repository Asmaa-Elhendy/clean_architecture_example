import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdate;
  const FormSubmitBtn(
      {required this.onPressed, required this.isUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(isUpdate ? "Update" : "Add"),
      icon: isUpdate ? Icon(Icons.update) : Icon(Icons.add),
    );
  }
}
