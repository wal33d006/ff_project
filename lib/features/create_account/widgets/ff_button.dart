import 'package:flutter/material.dart';

class FFButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FFButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}
