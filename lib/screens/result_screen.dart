import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/providers/summery_provider.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/show_summery.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen(this.restart, {super.key});
  final void Function() restart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summeryData = ref.watch(summaryProvider);
    final totalquestion = questionslist.length;
    final correctquestions = summeryData
        .where((data) => data['Correct_Answers'] == data['selected_ANswer'])
        .length;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 60, 5, 5),
          child: Text(
            'Correct Answers = $correctquestions out of $totalquestion',
            style: GoogleFonts.lato(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ShowSummery(summeryData),
            const SizedBox(height: 10),
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
      ],
    );
  }
}
