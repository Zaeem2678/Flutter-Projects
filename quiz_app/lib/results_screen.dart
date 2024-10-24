import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen(this.chosenAnswers, this.getScore, this.reattemptQuiz,
      {super.key});

  final List<String> chosenAnswers;
  final int Function() getScore;
  final void Function() reattemptQuiz;

  @override
  State<ResultsScreen> createState() {
    return _ResultsScreen();
  }
}

class _ResultsScreen extends State<ResultsScreen> {
  int totalQuestions = questions.length;

  String getPerformance() {
    Function score = widget.getScore;
    double percentage = (score() / totalQuestions) * 100;
    if (percentage >= 70) {
      return 'Very Good';
    } else if (percentage >= 40) {
      return 'good';
    } else {
      return 'Poor';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered ${widget.getScore()} out of $totalQuestions correctly!",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            "Performance: ${getPerformance()}",
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const LinearBorder(
                    side: BorderSide(style: BorderStyle.solid)),
                foregroundColor: const Color.fromARGB(255, 2, 14, 24),
                textStyle: const TextStyle(fontSize: 17)),
            onPressed: widget.reattemptQuiz,
            child: const Text(
              "Restart Quiz",
            ),
          ),
        ],
      ),
    );
  }
}
