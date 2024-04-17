import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  PasswordTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'auth.Password'.tr(),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[\W_]).{8,}$').hasMatch(value)) {
          return 'Password must contain at least one uppercase letter and one special character';
        }
        return null;
      },
    );
  }
}
