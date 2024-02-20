import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answertext, this.onTap, {super.key});

  final String answertext;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,5,0,0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 154, 27, 78),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
        onPressed: onTap,
        child: Text(answertext,
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.black,
            )),
      ),
    );
  }
}
