import 'package:flutter/material.dart';

Padding inputForm(
  String? Function(String?) validate, {
  required TextEditingController controller,
  required String hintTxt,
  bool password = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        obscureText: password,
        validator: validate,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    ),
  );
}
