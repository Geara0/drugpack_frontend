import 'package:flutter/material.dart';

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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Clicks: $count',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      incrementCount();
                    },
                    child: Text('Click Me'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _transformer(DrugDto dto) {
    return Text(dto.name);
  }

  void _onTapResult(DrugDto dto, String query) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DrugPage(drugDto: dto),
      ),
    );
  }

// Future<Iterable<String>> _getHistory() {
//   return 'fgasdrse';
// }
}
