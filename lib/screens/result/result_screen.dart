import 'package:flutter/material.dart';
import 'package:quiz_app/quizData/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/result/components/show_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedanswers, this.restart, {super.key});
  final List<String> selectedanswers;
  final void Function() restart;
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
            style: GoogleFonts.lato(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ShowSummery(getSummery()),
          const SizedBox(height: 20),
          TextButton.icon(
              onPressed: restart,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: Text(
                'Requiz',
                style: GoogleFonts.lato(fontSize: 30),
              ))
        ]),
      ),
    );
  }
}
