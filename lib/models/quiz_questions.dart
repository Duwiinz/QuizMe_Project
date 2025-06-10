
class QuizQuestion {
  const QuizQuestion(this.text, this.answers,);
  
  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffledAnswers = List<String>.from(answers); // or using a cascade operator: = List<String>.from(answers)..shuffle();
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

}