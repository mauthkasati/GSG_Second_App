import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:provider/provider.dart';
import 'package:quran/surah_data.dart';
import 'package:easy_localization/easy_localization.dart';

class OneAchievement extends StatelessWidget {
  final int id;
  final String firstChar;
  final String verse;
  final String suarh;

  OneAchievement(this.id, this.firstChar, this.verse, this.suarh, {super.key});
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
              gradient: value.isDarkTheme == 1
                  ? const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 10, 10, 10),
                        Color.fromARGB(255, 30, 30, 30),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                  : LinearGradient(
                      colors: [
                        Colors.purple.shade300,
                        Colors.blue.shade300,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.center,
                    ),
              boxShadow: [
                value.isDarkTheme == 1
                    ? BoxShadow(
                        color: Colors.grey.shade700.withOpacity(0.0),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      )
                    : BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
              ],
              border: Border.all(
                width: 1,
                color: value.isDarkTheme == 1
                    ? const Color.fromARGB(255, 15, 100, 50)
                    : Colors.black,
              ),
              color: value.isDarkTheme == 1
                  ? const Color.fromARGB(255, 18, 18, 18)
                  : Colors.blue.shade700,
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(20),
          margin: const EdgeInsets.all(7),
          child: Row(
            children: [
              Text(
                suarh,
                style: TextStyle(
                  color: value.isDarkTheme == 1
                      ? const Color.fromARGB(255, 130, 44, 44)
                      : Colors.brown.shade900,
                  fontSize: 18,
                  decoration: TextDecoration.none,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      verse,
                      style: GoogleFonts.tajawal(
                        textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: value.isDarkTheme == 1
                              ? const Color.fromARGB(255, 59, 133, 59)
                              : Colors.black,
                          fontSize: 14,
                          letterSpacing: .5,
                        ),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade500
                              : Colors.black,
                        ),
                        color: const Color.fromARGB(255, 59, 133, 59),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          firstChar,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade900
                                : Colors.black,
                            decoration: TextDecoration.none,
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
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade500
                              : Colors.black,
                        ),
                        color: value.isDarkTheme == 1
                            ? Colors.brown.shade800
                            : Colors.brown.shade500,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          id.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade400
                                : Colors.black,
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
