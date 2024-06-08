import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'auth.Email'.tr(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLines: 1,
          decoration: const InputDecoration(
            helperText: ' ',
            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (kDebugMode) return null;

            if (value == null || value.isEmpty) {
              return 'validation error.Email is empty'.tr();
            } else {
              final RegExp emailRegex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (!emailRegex.hasMatch(value)) {
                return 'validation error.Invalid email'.tr();
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
