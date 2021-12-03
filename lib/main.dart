import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import "package:yaml/yaml.dart";

import './render.dart';

Future<dynamic> loadData(String path) async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await rootBundle.loadString(path);
  final mapData = loadYaml(data);
  return mapData;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<dynamic> layout = loadData('assets/counter.yaml');

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<dynamic>(
        future: layout, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SizedBox.expand(child: render(snapshot.data));
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ]));
          } else {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ]));
          }
        },
      ),
    );
  }
}
