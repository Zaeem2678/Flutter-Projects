class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.correctAnswers);
  final String text;
  final List<String> answers;
  final String correctAnswers;

  List<String> getShuffledAnswers() {
    final copyOfAnswers = List.of(answers);
    copyOfAnswers.shuffle();
    return copyOfAnswers;
  }
}
