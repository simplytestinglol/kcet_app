// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:kcet_app/mathqns.dart';
import 'package:kcet_app/resultscreen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() => runApp(Math());

class Math extends StatefulWidget {
  @override
  _MathState createState() => _MathState();
}

class _MathState extends State<Math> {
  List<Widget> children = <Widget>[];
  var i = 0;

  @override
  Widget build(BuildContext context) {
    int endTime0 = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

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
                },
                child: Center(
                    child: Text('KCET Quiz App',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center))),
            backgroundColor: Colors.pinkAccent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: CountdownTimer(
                  endTime: endTime0,
                  onEnd: () {
                    return (mounted != 0)
                        ? setState(() {
                            if (i < list_data.length - 1) {
                              i++;
                            } else {
                              subject = 2;
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new ResultScreen()),
                              );
                            }
                          })
                        : 0;
                  },
                  widgetBuilder: (_, CurrentRemainingTime time) {
                    if (time == null) {
                      return StepProgressIndicator(
                        totalSteps: 60,
                        currentStep: 60,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.yellow,
                        unselectedColor: Colors.cyan,
                        roundedEdges: Radius.circular(10),
                        selectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.yellowAccent, Colors.deepOrange],
                        ),
                        unselectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.black, Colors.blue],
                        ),
                      );
                    }
                    return StepProgressIndicator(
                      totalSteps: 60,
                      currentStep:
                          (time.sec == null) ? (60 - 0) : (60 - time.sec),
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.yellow,
                      unselectedColor: Colors.cyan,
                      roundedEdges: Radius.circular(10),
                      selectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.yellowAccent, Colors.deepOrange],
                      ),
                      unselectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black, Colors.blue],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 120,
                child: Card(
                    child: InkWell(
                        onTap: () {
                          print(list_data[i]['question']);
                        },
                        child: Center(
                            child: Text(list_data[i]['question'] ?? 'error ',
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center)))),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: list_data.length + 1,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: Card(
                            child: InkWell(
                                splashColor: (list_data[i]["ans"] == index)
                                    ? Colors.green
                                    : Colors.red,
                                highlightColor: (list_data[i]["ans"] == index)
                                    ? Colors.green
                                    : Colors.red,
                                onTap: () {
                                  count[2] = (list_data[i]["ans"] == index)
                                      ? count[2] + 1
                                      : count[2];
                                  // print(i);
                                  // print(count[2]);
                                  print(index);

                                  (mounted != 0)
                                      ? setState(() {
                                          if (i < list_data.length - 1) {
                                            i++;
                                          } else {
                                            subject = 0;
                                            Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new ResultScreen()),
                                            );
                                          }
                                        })
                                      : 0;
                                },
                                child: Center(
                                    child: Text(
                                        list_data[i]["options"][index] ??
                                            "error",
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center)))),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )),
    );
  }
}
