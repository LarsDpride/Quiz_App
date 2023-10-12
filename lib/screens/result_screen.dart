import 'package:flutter/material.dart';
import 'package:quiz_app/quizData/questions_list.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedanswers, {super.key});
  final List<String> selectedanswers;
  List<Map<String, Object>> getSummery() {
    List<Map<String, Object>> summery = [];

    for (int i = 0; i <= selectedanswers.length; i++) {
      summery.add({
        'Question_index': i,
        'Question': questionslist[i].text,
        'Correct_Answers': questionslist[0].answers,
        'selected_ANswer': selectedanswers[i],
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(90),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('you answered out of 6'),
          TextButton(onPressed: () {}, child: const Text('Requiz'))
        ]),
      ),
    );
  }
}
