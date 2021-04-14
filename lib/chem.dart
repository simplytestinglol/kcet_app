// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:kcet_app/chemqns.dart';
import 'package:kcet_app/resultscreen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() => runApp(Chem());

class Chem extends StatefulWidget {
  @override
  _ChemState createState() => _ChemState();
}

class _ChemState extends State<Chem> {
  List<Widget> children = <Widget>[];
  var i = 0;
  int endTime1 = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

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
                  endTime: endTime1,
                  onEnd: () {
                    subject = 0;
                    endTime1 =
                        DateTime.now().millisecondsSinceEpoch + 1000 * 60;
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new ResultScreen()));
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
                      currentStep: 60 - time.sec,
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
                                  count[1] = (list_data[i]["ans"] == index)
                                      ? count[1] + 1
                                      : count[1];
                                  // print(i);
                                  // print(count[1]);
                                  print(index);

                                  setState(() {
                                    if (i < list_data.length - 1)
                                      i++;
                                    else {
                                      subject = 0;
                                      endTime1 = DateTime.now()
                                              .millisecondsSinceEpoch +
                                          1000 * 60;
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new ResultScreen()),
                                      );
                                    }
                                  });
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
