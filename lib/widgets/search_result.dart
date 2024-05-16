import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final DrugDto searchDrugResult;

  const SearchResult({super.key, required this.searchDrugResult});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => PersonDetailPage(person: personResult),
      //     ),
      //   );
      // },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                searchDrugResult.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                searchDrugResult.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
