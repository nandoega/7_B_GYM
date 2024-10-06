import 'package:flutter/material.dart';

// Component to create input form fields with validation
Padding inputForm(
  Function(String?) validasi, {
  required TextEditingController controller,
  required String hintTxt,
  required String helperTxt,
  required IconData iconData,
  bool password = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SizedBox(
      width: 350,
      child: TextFormField(
        validator: (value) => validasi(value),
        autofocus: false,
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: const OutlineInputBorder(),
          helperText: helperTxt,
          prefixIcon: Icon(iconData),
        ),
      ),
    ),
  );
}
