import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 67, 30, 133),
            Color.fromARGB(255, 22, 13, 39),
          ],
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
