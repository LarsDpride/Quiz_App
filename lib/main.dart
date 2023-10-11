import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/quizData/questions_list.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    const Quiz(),
  );
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> correctanswers = [];
  String activescreen = 'start_screen';
  void switchScreen() {
    setState(() {
      activescreen = 'question_screen';
    });
  }

  void choosedAnswers(String answers) {
    correctanswers.add(answers);
    if (correctanswers.length == questionslist.length) {
      setState(() {
        activescreen = 'start_screen';
        correctanswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bc.jpg'),
            ),
          ),
          child: activescreen == 'start_screen'
              ? StartScreen(switchScreen)
              : QuestionScreen(choosedAnswers),
        ),
      ),
    );
  }
}
