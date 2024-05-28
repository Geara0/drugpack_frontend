import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../dto/drug/drug_dto.dart';
import '../widgets/search_bar/search_bar.dart';
import 'drug_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          children: <Widget>[
            Search.bar(
              transformer: _transformer,
              onTapResult: _onTapResult,
            ),
          ],
        ));
  }

  Widget _transformer(DrugDto drugDto) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            drugDto.name,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  void _onTapResult(DrugDto drugDto, String query) {
    context.goNamed("drug",
        pathParameters: {'id': drugDto.id.toString()}, extra: drugDto);
  }

// Future<Iterable<String>> _getHistory() {
//   return 'fgasdrse';
// }
}
