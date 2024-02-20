import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/questions_sc/answer_buttons.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.choosedAnswers, {super.key});
  final void Function(String answers) choosedAnswers;
  @override
  State<QuestionScreen> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  var currentquestionindex = 0;
  void changeIndex(String answers) {
    widget.choosedAnswers(answers);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questionslist[currentquestionindex];
    return  Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentquestion.text,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 15,
            ),
            //... is spread opreater divide list into indivitual widgets
            ...currentquestion.shuffleAnswers().map(
                  (answers) => AnswerButton(answers, () {
                    changeIndex(answers);
                  }),
                ),
             
          ],
        )
      );

  }
}
