import 'package:drugpack/blocs/profile_bloc/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile_bloc/profile_event.dart';
import '../dto/drug/drug_dto.dart';

class DrugPage extends StatelessWidget {
  final DrugDto drugDto;
  final String id;

  DrugPage({required this.id, required this.drugDto}) : super();

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(drugDto.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID: ${drugDto.id}',
              ),
              Text(
                'Name: ${drugDto.name}',
              ),
              if (drugDto.packaging != null)
                Text(
                  'Packaging: ${drugDto.packaging}',
                ),
              Text(
                'Firm: ${drugDto.firm}',
              ),
              ExpansionTile(
                title: Text('Description'),
                children: [
                  if (drugDto.description != null)
                    ...drugDto.description!.toJson().entries.map((entry) {
                      if (entry.value != null) {
                        return ListTile(
                          leading: Text(entry.key),
                          title: Text(
                            '${entry.value}',
                          ),
                        );
                      }
                      return Container();
                    }),
                ],
              ),
              ExpansionTile(
                title: Text('Active Substance'),
                children: [
                  if (drugDto.activeSubstance != null)
                    ...drugDto.activeSubstance!.toJson().entries.map((entry) {
                      if (entry.value != null) {
                        return ListTile(
                          leading: Text(entry.key),
                          title: Text('${entry.value}',
                              style: TextStyle(fontSize: 16.0)),
                        );
                      }
                      return Container();
                    }),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      profileBloc.add(AddAccountDrug(drugDto.id.toString()));
                    },
                    child: Text('AddAccountDrug'.tr()),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      profileBloc.add(RemoveAccountDrug(drugDto.id.toString()));
                    },
                    child: Text('RemoveAccountDrug'.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
