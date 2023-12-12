import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions/question_screen.dart';
import 'package:quiz_app/quizData/questions_list.dart';
import 'package:quiz_app/screens/result/result_screen.dart';
import 'package:quiz_app/screens/start/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedanswers = [];

  String activescreen = 'start_screen';
  void switchScreen() {
    setState(() {
      activescreen = 'question_screen';
    });
  }

  void choosedAnswers(String answers) {
    selectedanswers.add(answers);
    if (selectedanswers.length == questionslist.length) {
      setState(() {
        activescreen = 'result_screen';
      });
    }
  }

  void restart() {
    setState(() {
      activescreen = 'start_screen';
      selectedanswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget showscreen = StartScreen(switchScreen);
    if (activescreen == 'question_screen') {
      showscreen = QuestionScreen(choosedAnswers);
    }
    if (activescreen == 'result_screen') {
      showscreen = ResultScreen(selectedanswers, restart);
    }
    if (activescreen == 'start_screen') {
      showscreen = StartScreen(switchScreen);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bc.jpg'),
          ),
        ),
        child: showscreen,
      ),
    );
  }
}
