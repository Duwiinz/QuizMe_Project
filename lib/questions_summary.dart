import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];
          
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCorrect ? const Color.fromARGB(255, 76, 187, 141) 
                    : const Color.fromARGB(255, 228, 56, 26), // Green for correct, red for wrong
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white, // White text inside the circle
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  data['question'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 247, 248, 248),
                    //fontWeight: FontWeight.bold,
                    fontSize: 16
                    ),
                  ),
                SizedBox(height: 5,),
                Text(data['user_answer'] as String,
                style: TextStyle(
                          color: const Color.fromARGB(255, 245, 206, 97),
                          //fontWeight: FontWeight.bold,
                        ),
                ),
                Text(data['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 109, 242, 247), 
                  //fontWeight: FontWeight.bold
                  ),
                ),
              ],),
            )
          ],);
          },
         ).toList(),
           ),
      ),
    );
  }
}