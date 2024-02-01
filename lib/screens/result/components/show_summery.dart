import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowSummery extends StatelessWidget {
  const ShowSummery(this.summery, {super.key});

  final List<Map<String, Object>> summery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: ListView(
        children:[Column(
          children: summery
              .map(
                (data) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 232, 84, 145),
                      ),
                      child: Text(
                        ((data['Question_index'] as int) + 1).toString(),
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            (data['Question']).toString(),
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            (data['Correct_Answers']).toString(),
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                color:
                                    const Color.fromARGB(255, 232, 126, 219)),
                          ),
                          Text(
                            (data['selected_ANswer']).toString(),
                            style: GoogleFonts.lato(
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
        ]
      ),
    );
  }
}
