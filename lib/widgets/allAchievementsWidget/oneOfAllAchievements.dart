import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_second_project/enums_lists_maps/categories.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:provider/provider.dart';

class OneOfAllAchievement extends StatelessWidget {
  final int id;
  final String noteText;
  final String cat;
  final int verseID;
  final int sID;

  const OneOfAllAchievement(
      this.id, this.noteText, this.cat, this.verseID, this.sID,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Container(
          height: height / 8,
          width: width * 7 / 8,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 15, 100, 50),
              ),
              color: const Color.fromARGB(255, 18, 18, 18),
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(20),
          margin: const EdgeInsets.all(7),
          child: Row(
            children: [
              Text(
                cat,
                style: const TextStyle(
                  color: Color.fromARGB(255, 130, 44, 44),
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneNoteScreen(
                              cat,
                              verseID,
                              noteText,
                              sID,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 25,
                        width: 175,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            noteText,
                            style: GoogleFonts.tajawal(
                              textStyle: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Color.fromARGB(255, 59, 133, 59),
                                fontSize: 14,
                                letterSpacing: .5,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.2,
                          color: Colors.grey.shade500,
                        ),
                        color: Colors.brown.shade800,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          id.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
