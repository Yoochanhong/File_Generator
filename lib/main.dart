import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();
  TextEditingController pathController = TextEditingController();

  Future<void> _saveTextToFile(String path) async {
    final text = inputController.text;
    final bytes = text.codeUnits;
    final file = File('$path/my_file.c');
    await file.writeAsBytes(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("파일 생성기"),
        actions: [
          IconButton(
              onPressed: () {
                _saveTextToFile(pathController.text);
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  maxLines: 1,
                  controller: pathController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: inputController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
