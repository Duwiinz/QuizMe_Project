import 'package:flutter/material.dart';
import 'package:quiz_me/answer_button.dart';
import 'package:quiz_me/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});  //required is used to make the parameter mandatory

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;
  
  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);  //passing the answer to the function  
    setState(() {
      //currentQuestionIndex = currentQuestionIndex + 1;
      //currentQuestionIndex += currentQuestionIndex;
      currentQuestionIndex++; //increament the value by 1
    });
  }
  
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(                           //SizeBox is also an Alternative to Center
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 238, 219, 219),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
        
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AnswerButton(
                      answerText: answer,
                      onTap: (){
                        answerQuestion(answer);
                      },
                    ),
                  ),
                  SizedBox(height: 1),
                ],
              );
              
            }),
            
            /*AnswerButton(
              answerText: currentQuestion.answers[0], 
              onTap: (){},
              ),
            AnswerButton(
              answerText: currentQuestion.answers[1], 
              onTap: (){},
              ),
            AnswerButton(
              answerText: currentQuestion.answers[2], 
              onTap: (){},
              ),
              AnswerButton(
              answerText: currentQuestion.answers[3], 
              onTap: (){},
              ), */ 
          ],
        ),
      ),
    );
  }
}