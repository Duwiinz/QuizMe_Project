import 'package:flutter/material.dart';
import 'package:quiz_me/data/questions.dart';
import 'package:quiz_me/questions_summary.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final VoidCallback onRestart; // Callback for restarting the quiz
  

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
Widget build(context) {
  final summaryData = getSummaryData();
  final numTotalQuestions = questions.length;
  final numCorrectQuestions = summaryData.where((data) {
     return data['correct_answer'] == data['user_answer'];}).length;

  return SizedBox(
    width: double.infinity, 
    child: Container(
      margin: const EdgeInsets.all(40), 
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions answers',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 238, 219, 219),
            ),
            textAlign: TextAlign.center, // Aligns the text to the center
          ),
          // Second part of the text (centered "correctly!")
          Text(
            'correctly!',
            style: const TextStyle(
              fontSize: 20, // Slightly larger font for emphasis
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 238, 219, 219), // Optional: Make it green for emphasis
            ),
            textAlign: TextAlign.center, // Center-align this part
          ),
          const SizedBox(height: 20,),
          QuestionsSummary(summaryData: summaryData),
          const SizedBox(height: 30,),
          TextButton.icon(
            onPressed: () {
              onRestart(); // Call the restart function passed from the parent widget
              // Navigator.of(context).pop(); // Optionally, you can navigate back to the previous screen
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 238, 219, 219),
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(Icons.refresh,
            color: Color.fromARGB(255, 238, 219, 219),
            ),
            label: const Text('Restart Quiz!'),
          )
        ],
       ),
      ),
    );
  }
}