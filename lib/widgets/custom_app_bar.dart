import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logoDark = 'assets/images/dark_logo_DRUG.png';
  final String logoLight = 'assets/images/light_logo_DRUG.png';

  CustomAppBar() : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        Theme.of(context).brightness == Brightness.light ? logoDark : logoLight,
        fit: BoxFit.contain,
        height: 48,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
