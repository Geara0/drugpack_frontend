import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

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
          return 'validation error.Password is empty'.tr();
        } else if (value.length < 8) {
          return 'validation error.Short password'.tr();
        } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[\W_]).{8,}$').hasMatch(value)) {
          return 'validation error.Unsafe password'.tr();
        }
        return null;
      },
    );
  }
}
