import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_math_game/constants/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameArea extends StatefulWidget {
  final Color color;
  final String gameOperator;
  final int score;
  final String keyScore;
  const GameArea({
    Key? key,
    required this.color,
    required this.gameOperator,
    required this.score,
    required this.keyScore,
  }) : super(key: key);

  @override
  State<GameArea> createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  bool _start = false;
  int difficulty = 0;
  int answer = 0;
  String answerS = "";
  int number1 = 0;
  int number2 = 0;
  double _counter = 0;
  int _score = 0;
  int _highScore = 1;
  late Timer _timer;
  final myController = TextEditingController();
  Random random = Random();

  Future<void> saveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _highScore = _highScore > _score ? _highScore : _score;
    sharedPreferences.setInt(widget.keyScore, _highScore);
  }

  Future<void> readySharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _highScore = sharedPreferences.getInt(widget.keyScore) ?? 0;
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    readySharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: _start
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Score: $_score",
                  style: TextStyle(color: widget.color, fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Süre: ${_counter.toStringAsFixed(0)}",
                    style: TextStyle(color: widget.color, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "$number1 ${widget.gameOperator} $number2 = ?",
                    style: TextStyle(color: widget.color, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 64, right: 64, top: 16),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        answerS = myController.text;
                        if (answer.toString() == answerS) {
                          _correctAnswer();
                        } else {
                          _wrongAnswer();
                        }
                        myController.text = "";
                      });
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter Answer",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fillColor: widget.color,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          )),
                    ),
                    controller: myController,
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 32),
                  child: Text(
                    "Highest Score: $_highScore",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: widget.color, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: Sabitler.buttonStyle(widget.color),
                          onPressed: () {
                            setState(() {
                              hideWidget();
                              _counter = 10;
                              _score = 0;
                              difficulty = 1;
                              _startGame(widget.gameOperator);
                              _startTimer();
                            });
                          },
                          child: Text(
                            "Easy Game",
                            style: Sabitler.difficultyTextStyle,
                          )),
                      const Divider(),
                      ElevatedButton(
                          style: Sabitler.buttonStyle(
                            widget.color,
                          ),
                          onPressed: () {
                            setState(() {
                              hideWidget();
                              _counter = 10;
                              _score = 0;
                              difficulty = 2;
                              _startGame(widget.gameOperator);
                              _startTimer();
                            });
                          },
                          child: Text(
                            "Medium Game",
                            style: Sabitler.difficultyTextStyle,
                          )),
                      const Divider(),
                      ElevatedButton(
                          style: Sabitler.buttonStyle(
                            widget.color,
                          ),
                          onPressed: () {
                            setState(() {
                              hideWidget();
                              _counter = 10;
                              _score = 0;
                              difficulty = 4;
                              _startGame(widget.gameOperator);
                              _startTimer();
                            });
                          },
                          child: Text(
                            "Hard Game",
                            style: Sabitler.difficultyTextStyle,
                          )),
                      const Divider(),
                      ElevatedButton(
                          style: Sabitler.buttonStyle(
                            widget.color,
                          ),
                          onPressed: () {
                            setState(() {
                              hideWidget();
                              _counter = 10;
                              _score = 0;
                              difficulty = 8;
                              _startGame(widget.gameOperator);
                              _startTimer();
                            });
                          },
                          child: Text(
                            "Extreme Game",
                            style: Sabitler.difficultyTextStyle,
                          )),
                    ],
                  ),
                ),
              ],
            ),
      color: Sabitler.mainbackgroundColor,
    );
  }

  void hideWidget() {
    setState(() {
      _start = !_start;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          hideWidget();
          _timer.cancel();
        }
      });
    });
  }

  void _startGame(String gameOperator) {
    number1 = random.nextInt(100 * difficulty);
    number2 = random.nextInt(100 * difficulty);
    switch (gameOperator) {
      case "+":
        answer = number1 + number2;
        break;
      case "-":
        number1 = random.nextInt(200 * difficulty);
        number2 = random.nextInt(50 * difficulty);
        while (number2 > number1) {
          number1 = random.nextInt(200 * difficulty);
          number2 = random.nextInt(50 * difficulty);
          if (number1 > number2) {
            break;
          }
        }
        answer = number1 - number2;
        break;
      case "/":
        while (number1 > 0) {
          number1 = random.nextInt(100 * difficulty) + 1;
          number2 = random.nextInt(100 * difficulty) + 1;
          if (number1 % number2 == 0 &&
              number2 != 1 &&
              number1 != 0 &&
              number2 != 0) {
            break;
          }
        }
        answer = number1 ~/ number2;

        break;
      case "*":
        number1 = random.nextInt(10 * difficulty);
        number2 = random.nextInt(10 * difficulty);

        answer = number1 * number2;
        break;
    }
  }

  void _correctAnswer() {
    setState(() {
      _score += difficulty;
      _counter += 10;
      saveData();
      _startGame(widget.gameOperator);
    });
  }

  void _wrongAnswer() {
    setState(() {
      saveData();
      _counter -= _counter / 2;
      _startGame(widget.gameOperator);
    });
  }
}
