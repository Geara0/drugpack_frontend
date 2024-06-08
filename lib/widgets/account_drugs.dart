import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drugpack/blocs/profile_bloc/profile_bloc.dart';
import 'package:drugpack/dto/drug/drug_dto.dart';

class AccountDrugs extends StatefulWidget {
  @override
  _AccountDrugsState createState() => _AccountDrugsState();
}

class _AccountDrugsState extends State<AccountDrugs> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetAccount());
  }

  Future<void> _refreshData() async {
    context.read<ProfileBloc>().add(GetAccount());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final drugs = context.read<ProfileBloc>().drugs;
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView.builder(
              itemCount: drugs.length,
              itemBuilder: (BuildContext context, int index) {
                final drug = drugs[index];
                return Card(
                  child: ListTile(
                    title: Text(drug.name),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
