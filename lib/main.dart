import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Games games = new Games();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: Scaffold(
          body: Center(
              child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.all(10), child: Text(get_txt('point')))),
          Expanded(
              flex: 8,
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(get_txt('img')))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ElevatedButton(
                      onPressed: () => ans_1(),
                      child: Text(get_txt('1')),
                      style:
                          TextButton.styleFrom(minimumSize: Size(800, 400))))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ElevatedButton(
                      onPressed: () => ans_2(),
                      child: Text(get_txt('2')),
                      style:
                          TextButton.styleFrom(minimumSize: Size(800, 400))))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ElevatedButton(
                      onPressed: () => ans_3(),
                      child: Text(get_txt('3')),
                      style:
                          TextButton.styleFrom(minimumSize: Size(800, 400))))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ElevatedButton(
                      onPressed: () => ans_4(),
                      child: Text(get_txt('4')),
                      style:
                          TextButton.styleFrom(minimumSize: Size(800, 400))))),
        ],
      ))),
    );
  }

  void ans_1() {
    debugPrint(games.randomAns[0]);
    setState(() {
      if (games.randomAns[0] == games.currentQuest) {
        games.point++;
      } else {
        games.point = 0;
      }
      games.createNewGames();
    });
  }

  void ans_2() {
    debugPrint(games.randomAns[1]);
    setState(() {
      if (games.randomAns[1] == games.currentQuest) {
        games.point++;
      } else {
        games.point = 0;
      }
      games.createNewGames();
    });
  }

  void ans_3() {
    debugPrint(games.randomAns[2]);
    setState(() {
      if (games.randomAns[2] == games.currentQuest) {
        games.point++;
      } else {
        games.point = 0;
      }
      games.createNewGames();
    });
  }

  void ans_4() {
    debugPrint(games.randomAns[3]);
    setState(() {
      if (games.randomAns[3] == games.currentQuest) {
        games.point++;
      } else {
        games.point = 0;
      }
      games.createNewGames();
    });
  }

  String get_txt(String type) {
    String ret = '';
    setState(() {
      if (type == '1') {
        ret = games.randomAns[0];
      } else if (type == '2') {
        ret = games.randomAns[1];
      } else if (type == '3') {
        ret = games.randomAns[2];
      } else if (type == '4') {
        ret = games.randomAns[3];
      } else if (type == 'point') {
        ret = games.point.toString();
      } else if (type == 'img') {
        ret = 'assets/img/' + games.currentQuest + '.png';
      }
    });
    return ret;
  }
}

class Games {
  var point;
  var currentQuest;
  List<String> randomAns = ['', '', '', ''];
  final List<String> questList = [
    'bird',
    'cat',
    'dinasour',
    'elephant',
    'goat',
    'lion',
    'monkey',
    'pig',
    'tiger',
    'zebra'
  ];

  Games() {
    point = 0;
    currentQuest = '';
    createNewQuest();
    createRandomAns();
  }

  void createNewGames() {
    debugPrint('a');
    currentQuest = '';
    createNewQuest();
    createRandomAns();
  }

  void resetAll() {
    point = 0;
  }

  void createNewQuest() {
    while (true) {
      var random = new Random().nextInt(10);
      if (currentQuest != questList[random]) {
        currentQuest = questList[random];
        break;
      }
    }
  }

  void createRandomAns() {
    randomAns[3] = currentQuest;

    for (int i = 0; i < 3; i++) {
      var state = true;

      while (state) {
        var random = new Random().nextInt(10);

        for (int j = 0; j < 4; j++) {
          if (questList[random] == randomAns[j]) {
            state = false;
            break;
          }
        }

        if (!state) {
          state = true;
          continue;
        }

        randomAns[i] = questList[random];
        break;
      }
    }

    randomAns.shuffle();
  }
}
