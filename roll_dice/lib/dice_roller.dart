import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'Assets/dice-2.png';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 22),
          ),
          onPressed: () {
            int rand = Random().nextInt(6) + 1;
            setState(
              () {
                activeDiceImage = 'Assets/dice-$rand.png';
              },
            );
          },
          child: const Text("Roll Dice"),
        ),
      ],
    );
  }
}
