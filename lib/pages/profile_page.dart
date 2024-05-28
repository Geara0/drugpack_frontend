import 'package:drugpack/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
        title: const Text('Profile'),
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
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              SizedBox(width: 10),
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
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/auth/registration');
            },
            child: Text('Препараты'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.go('/auth/registration');
            },
            child: Text('Заболевания'),
          ),
        ],
      ),
    );
  }
}
