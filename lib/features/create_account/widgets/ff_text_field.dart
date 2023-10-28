import 'package:flutter/material.dart';

class FFTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;
  final Widget? suffixIcon;

  const FFTextField({
    super.key,
    required this.onChanged,
    this.hintText = '',
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
