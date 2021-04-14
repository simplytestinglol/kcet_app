// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:kcet_app/chem.dart';
import 'package:kcet_app/math.dart';
import 'package:kcet_app/phy.dart';
import 'package:kcet_app/resultscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
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
                onTap: () => print('hello'),
                child: Center(
                    child: Text('KCET Quiz App',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center))),
            backgroundColor: Colors.pinkAccent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Card(
                    child: InkWell(
                        onTap: () {
                          count = [0, 0, 0];
                          endTime0 =
                              DateTime.now().millisecondsSinceEpoch + 1000 * 60;
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Phy()),
                          );
                        },
                        child: Center(
                            child: Text('Physics',
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center)))),
              ),
              Expanded(
                child: Card(
                    child: InkWell(
                        onTap: () {
                          count = [0, 0, 0];

                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Chem()),
                          );
                        },
                        child: Center(
                            child: Text('Chemistry',
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center)))),
              ),
              Expanded(
                child: Card(
                    child: InkWell(
                        onTap: () {
                          count = [0, 0, 0];

                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Math()),
                          );
                        },
                        child: Center(
                            child: Text('Mathematics',
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center)))),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          )),
    );
  }
}
