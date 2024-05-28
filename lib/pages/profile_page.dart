import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../themes/themes.dart';
import '../utils/account_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(
        Theme.of(context).brightness == Brightness.light ? 'assets/images/light_logo_DRUG.png' : 'assets/images/dark_logo_DRUG.png',
        fit: BoxFit.contain,
        height: 48,
      ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              const FlutterSecureStorage().deleteAll();
              context.go('/auth/login');
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              decoration: ThemeClass.containerDecoration(context),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.account_circle, size: 70,),
                  SizedBox(width: 20),
                  FutureBuilder<String>(
                    future: AccountUtils.accountEmail,
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Пользователь');
                      } else {
                        return Text('${snapshot.data}');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/auth/registration');
              },
              child: Text('Препараты'),
            ),
          ],
        ),
      ),
    );
  }
}
