import 'package:drugpack/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

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
      body: Center(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listenWhen: (prev, curr) => curr is ProfileFailure,
          buildWhen: (prev, curr) => curr is! ProfileFailure,
          listener: (context, state) {
            if (state is ProfileFailure) {
              // show message error
            }
          },
          builder: (BuildContext context, ProfileState state) {
            if (state is ProfileLoading) {
              return const CircularProgressIndicator.adaptive();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Drugs: ${bloc.drugs}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                // Text(
                //   'Drug Name: ${context.watch<ProfileBloc>().accountDrug}', // Display Drug name
                //   style: TextStyle(fontSize: 20),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
