import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQuestion.text,
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 138, 107, 196),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 18,
          ),
          ...currentQuestion.getShuffledAnswers().map(
            (item) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: AnswerButton(
                    text: item,
                    onTap: () {
                      answerQuestion(item);
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
