import 'package:flutter/material.dart';
import 'package:quiz_me/question_screen.dart';
import 'package:quiz_me/start_screen.dart';
import 'package:quiz_me/data/questions.dart';
import 'package:quiz_me/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

   //List<String> selectedAnswers = [];
   List<String> chosenAnswers = []; //List to store the answers chosen by the user

//Tenary operator is used to switch between screens
var activeScreen = 'start-screen';

/*Widget? activeScreen;

INIT STATE METHOD IS USE TO SET THE INITIAL STATE OF THE WIDGET 
AND TO SWITCH BETWEEN WIDGETS SCREENS.
@override
void initState() {
  activeScreen = StartScreen(changeScreen);
  super.initState();
}*/

void changeScreen() {
  setState(() {
    activeScreen = 'question-screen';
  });
}

void chooseAnswer(String selectedAnswer) {
  chosenAnswers.add(selectedAnswer);

  if (chosenAnswers.length == questions.length) {
    setState(() {
      //selectedAnswers = [];
      activeScreen = 'results-screen';
    });
  }
}

void restartQuiz() {
    setState(() {
      chosenAnswers = []; // Reset the chosen answers
      activeScreen = 'start-screen'; // Navigate back to the start screen
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(changeScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    /* tenary operator is used to switch between screens outside the widget tree
    final screenWidget = activeScreen == 'start-screen'
    ? StartScreen(changeScreen)
    : const QuestionsScreen();*/

    if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(
        chosenAnswers: chosenAnswers,
        onRestart: restartQuiz,
        );
    }

    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepOrange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
           ),
         ),
         child: screenWidget,
         
         /*activeScreen == 'start-screen' //Tenary operator is used to switch between screens
         ? StartScreen(changeScreen) 
         : const QuestionsScreen()*/

      ),
     ),
    );
  }
}