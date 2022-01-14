import 'package:quick_math_game/widgets/game.dart';
import 'package:flutter/material.dart';
import 'package:quick_math_game/constants/app_constant.dart';

class ToplamaOyunu extends StatefulWidget {
  const ToplamaOyunu({Key? key}) : super(key: key);

  @override
  _ToplamaOyunuState createState() => _ToplamaOyunuState();
}

class _ToplamaOyunuState extends State<ToplamaOyunu> {
  final int _highScore = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        backgroundColor: Sabitler.plusGameColor,
        title: const Text(
          "Addition Game",
        ),
      ),
      body: GameArea(
        color: Sabitler.plusGameColor,
        keyScore: "plus",
        score: _highScore,
        gameOperator: "+",
      ),
    );
  }
}
