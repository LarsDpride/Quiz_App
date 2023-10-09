import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_buttons.dart';
import 'package:quiz_app/quizData/questions_list.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentquestion = questionslist[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentquestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              )),
          const SizedBox(
            height: 10,
          ),
          AnswerButton(currentquestion.answers[0], () {}),
          AnswerButton(currentquestion.answers[1], () {}),
          AnswerButton(currentquestion.answers[2], () {}),
          AnswerButton(currentquestion.answers[3], () {}),
        ],
      ),
    );
  }
}
