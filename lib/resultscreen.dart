// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:kcet_app/main.dart';
import 'package:kcet_app/phyqns.dart';

var count = [0, 0, 0];
int subject = 0;

void main() => runApp(ResultScreen());

class ResultScreen extends StatelessWidget {
  ResultScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RS());
  }
}

class RS extends StatefulWidget {
  @override
  _RSState createState() => _RSState();
}

class _RSState extends State<RS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      title: 'KCET Quiz App',
      home: Scaffold(
          appBar: AppBar(
            title: InkWell(
                onTap: () {
                  print('hi');
                  count[subject] = 0;
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new MyApp()),
                  );
                },
                child: Center(
                    child: Text('RESULTS HERE!',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center))),
            backgroundColor: Colors.pinkAccent,
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Card(
                      child: InkWell(
                          onTap: () async {
                            print('hi');

                            count[subject] = 0;
                            // Navigator.push(
                            //   context,
                            //   new MaterialPageRoute(
                            //       builder: (context) => new MyApp()),
                            // );
                            setState(() => Phoenix.rebirth(context));
                          },
                          child: Center(
                              child: Text(
                                  'YOUR RESULT IS ${count[subject]} / ${list_data.length} \n \n \n Click to go back to Home',
                                  style: TextStyle(fontSize: 25),
                                  textAlign: TextAlign.center)))),
                ),
              ])),
    );
  }
}
