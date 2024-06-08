import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'auth.Password'.tr(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            helperText: ' ',
            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
          ),
          obscureText: true,
          validator: (value) {
            if (kDebugMode) return null;

            if (value == null || value.isEmpty) {
              return 'validation error.Password is empty'.tr();
            } else if (value.length < 8) {
              return 'validation error.Short password'.tr();
            } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[\W_]).{8,}$')
                .hasMatch(value)) {
              return 'validation error.Unsafe password'.tr();
            }
            return null;
          },
        ),
      ],
    );
  }
}
