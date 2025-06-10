import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen (this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // OPACITY IS USED TO MAKE IMAGE LESS VISIBLE
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                'assets/images/quiz-logo.png', 
                            width: 300,
                          ),
              ),
          const SizedBox(height: 70),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 238, 219, 219),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon( 
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              //backgroundColor: Colors.deepPurple, // Background color
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt, 
            color: Colors.white,
            ),
                    
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
         ], 
        ),
       );
  }
}