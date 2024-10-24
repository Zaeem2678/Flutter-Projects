import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'Assets/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(87, 255, 255, 255),
          ),
          const Text(
            "Learn Flutter the fun way !",
            style: TextStyle(
                color: Color.fromARGB(144, 255, 255, 255), fontSize: 22),
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: startQuiz,
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt_outlined),
          ),
        ],
      ),
    );
  }
}
