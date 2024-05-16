import 'package:flutter/material.dart';
import '../dto/drug/drug_dto.dart';

class DrugPage extends StatelessWidget {
  final DrugDto drugDto;

  DrugPage({required this.drugDto});

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
