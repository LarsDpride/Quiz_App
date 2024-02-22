import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/providers/selectedanswers_provider.dart';
import 'package:quiz_app/widgets/questions_sc/answer_buttons.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen(this.showResult, {super.key});
  final void Function() showResult;
  @override
  ConsumerState<QuestionScreen> createState() => _QuestionState();
}

class _QuestionState extends ConsumerState<QuestionScreen> {
  var currentquestionindex = 0;

  void changeIndex(String answers) {
    ref.read(selectedAnswersProvider.notifier).choosedAnswers(answers);
    widget.showResult();
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
