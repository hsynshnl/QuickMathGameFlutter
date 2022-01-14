import 'package:flutter/material.dart';
import 'package:quick_math_game/constants/app_constant.dart';
import 'package:quick_math_game/widgets/game.dart';

class CikartmaOyunu extends StatefulWidget {
  const CikartmaOyunu({Key? key}) : super(key: key);

  @override
  _CikartmaOyunuState createState() => _CikartmaOyunuState();
}

class _CikartmaOyunuState extends State<CikartmaOyunu> {
  final int _highScore = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 12,
          backgroundColor: Sabitler.minusGameColor,
          title: const Text("Extraction Game"),
        ),
        body: GameArea(
          color: Sabitler.minusGameColor,
          gameOperator: "-",
          score: _highScore,
          keyScore: "extraction",
        ));
  }
}
