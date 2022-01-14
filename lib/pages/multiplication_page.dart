import 'package:flutter/material.dart';
import 'package:quick_math_game/constants/app_constant.dart';
import 'package:quick_math_game/widgets/game.dart';

class CarpmaOyunu extends StatefulWidget {
  const CarpmaOyunu({Key? key}) : super(key: key);

  @override
  _CarpmaOyunuState createState() => _CarpmaOyunuState();
}

class _CarpmaOyunuState extends State<CarpmaOyunu> {
  final int _highScore = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        backgroundColor: Sabitler.multiplyGameColor,
        title: const Text("Multiply Game"),
      ),
      body: GameArea(
        score: _highScore,
        color: Sabitler.multiplyGameColor,
        gameOperator: "*",
        keyScore: "multiplication",
      ),
    );
  }
}
