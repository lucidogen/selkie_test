import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:selkie_test/app.dart';
import 'package:selkie_test/selkie/selkie.dart';

import 'selkie/selkie.dart';

Future<dynamic> getRoot() async {
  // In the real implementation, 'app' will be written in OCaml and this
  // call for json would be executed over the pipe/network using Garuda
  // protocol.
  final json = app.init();
  // The result should be the same as 'assets/counter.yaml'
  print(json);
  final mapData = jsonDecode(json);
  return mapData;
}

void main() {
  runApp(MyApp(selkie: Selkie()));
}

class MyApp extends StatelessWidget {
  final Selkie selkie;
  final Future<dynamic> layout = getRoot();

  MyApp({Key? key, required this.selkie}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: FutureBuilder<dynamic>(
          future: layout,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // This is just an ugly hack to get first render.
            // Normally, we would render directly with an initial
            // root layout (with id = 0) and then receive the first 'changes'
            // that would target root.
            if (snapshot.hasData) {
              return SizedBox.expand(
                  child: selkie.render(Layout(snapshot.data['changed'][0])));
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
      ),
    );
  }
}
