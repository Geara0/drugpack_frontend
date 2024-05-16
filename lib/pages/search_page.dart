import 'package:drugpack/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../dto/drug/drug_dto.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              const FlutterSecureStorage().deleteAll();
              context.go('/auth/login');
            },
          ),
        ],
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showSearch(context: context, delegate: CustomSearchDelegate());
        //     },
        //     icon: const Icon(Icons.search),
        //     color: Colors.white,
        //   )
        // ],
      ),
        body: Search.bar(transformer: _transformer, onTapResult: _onTapResult,),
    );
  }

  Widget _transformer(DrugDto dto) {
    return Text(dto.name);
  }

  void _onTapResult(DrugDto dto, String query) {
    debugPrint(dto.name);
  }

  // Future<Iterable<String>> _getHistory() {
  //   return 'fgasdrse';
  // }
}
