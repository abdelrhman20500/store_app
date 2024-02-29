import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,
    this.hintText,this.inputType, this.onChanged, this.obscureText = false});
  String? hintText;
 Function(String)? onChanged;
 TextInputType? inputType;
 bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: inputType,
      obscureText: obscureText!,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black)
        ),
        labelText: hintText,
      ),
    );
  }
}