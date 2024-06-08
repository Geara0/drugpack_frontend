import 'package:drugpack/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dto/drug/drug_dto.dart';
import '../themes/themes.dart';

class DrugPage extends StatelessWidget {
  final DrugDto drugDto;
  final String id;

  DrugPage({required this.id, required this.drugDto}) : super();

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<EditProfileBloc>();

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
              ...drugDto.toJson().entries.map((entry) {
                if (entry.value != null) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        decoration: ThemeClass.containerDecoration(context),
                        child: ListTile(
                          title: Text(entry.key.tr()),
                          subtitle: Text(
                            '${entry.value}',
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
              if (drugDto.description != null)
                ExpansionTile(
                  title: const Text('description').tr(),
                  children: [
                    ...drugDto.description!.toJson().entries.map((entry) {
                      if (entry.value != null) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            const Divider(height: 0),
                            Container(
                              decoration:
                                  ThemeClass.containerDecoration(context),
                              child: ListTile(
                                title: Text(entry.key.tr()),
                                subtitle: Text(
                                  '${entry.value}',
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    }),
                  ],
                ),
              if (drugDto.activeSubstance != null)
                ExpansionTile(
                  title: const Text('activeSubstance').tr(),
                  children: [
                    ...drugDto.activeSubstance!.toJson().entries.map((entry) {
                      if (entry.value != null) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              decoration:
                                  ThemeClass.containerDecoration(context),
                              child: ListTile(
                                title: Text(entry.key.tr()),
                                subtitle: Text('${entry.value}',
                                    style: const TextStyle(fontSize: 16.0)),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    }),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
