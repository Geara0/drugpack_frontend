import 'package:drugpack/blocs/profile_bloc/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile_bloc/profile_event.dart';
import '../dto/drug/drug_dto.dart';

class DrugPage extends StatelessWidget {
  final DrugDto drugDto;
  final String id;

  DrugPage({super.key, required this.id, required this.drugDto});

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(drugDto.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${drugDto.id}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Name: ${drugDto.name}',
              style: TextStyle(fontSize: 16.0),
            ),
            if (drugDto.packaging != null)
              Text(
                'Packaging: ${drugDto.packaging}',
                style: TextStyle(fontSize: 16.0),
              ),
            Text(
              'Firm: ${drugDto.firm}',
              style: TextStyle(fontSize: 16.0),
            ),
            Row(children: [ElevatedButton(
              onPressed: () {
                profileBloc.add(AddAccountDrug(drugDto.id.toString()));
              },
              child: Text('AddAccountDrug'.tr()),
            ),ElevatedButton(
              onPressed: () {
                profileBloc.add(RemoveAccountDrug(drugDto.id.toString()));
              },
              child: Text('RemoveAccountDrug'.tr()),
            ),],)
          ],
        ),
      ),
    );
  }
}
