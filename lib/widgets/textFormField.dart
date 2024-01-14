import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType
  });

  final String labelText;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  bool? obscureText=false;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        border:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 1),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
