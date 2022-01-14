import 'package:flutter/material.dart';
import 'package:quick_math_game/constants/app_constant.dart';
import 'package:quick_math_game/widgets/game.dart';

class BolmeOyunu extends StatefulWidget {
  const BolmeOyunu({Key? key}) : super(key: key);

  @override
  _BolmeOyunuState createState() => _BolmeOyunuState();
}

class _BolmeOyunuState extends State<BolmeOyunu> {
  final int _highScore = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        backgroundColor: Sabitler.divideGameColor,
        title: const Text(
          "Division Game",
        ),
      ),
      body: GameArea(
        color: Sabitler.divideGameColor,
        gameOperator: "/",
        keyScore: "division",
        score: _highScore,
      ),
    );
  }
}
