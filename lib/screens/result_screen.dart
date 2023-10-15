import 'package:flutter/material.dart';
import 'package:quiz_app/quizData/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedanswers, this.result, {super.key});
  final List<String> selectedanswers;
  final void Function() result;
  List<Map<String, Object>> getSummery() {
    List<Map<String, Object>> summery = [];

    for (int i = 0; i < selectedanswers.length; i++) {
      summery.add({
        'Question_index': i,
        'Question': questionslist[i].text,
        'Correct_Answers': questionslist[i].answers[0],
        'selected_ANswer': selectedanswers[i],
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummery();
    final totalquestion = questionslist.length;
    final correctquestions = summeryData
        .where((data) => data['Correct_Answers'] == data['selected_ANswer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(90),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You answered correctly $correctquestions out of $totalquestion',
            style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: getSummery()
                    .map(
                      (data) => Row(
                        children: [
                          Text(
                            ((data['Question_index'] as int) + 1).toString(),
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  (data['Question']).toString(),
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                Text(
                                  (data['Correct_Answers']).toString(),
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                Text(
                                  (data['selected_ANswer']).toString(),
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          TextButton(onPressed: result, child: const Text('Requiz'))
        ]),
      ),
    );
  }
}
