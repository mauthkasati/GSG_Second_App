// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:easy_localization/easy_localization.dart';

import 'package:gsg_second_project/providers/mainScreenProvider.dart';

// ignore: must_be_immutable
class Part extends StatelessWidget {
  final int numOfSurah;
  final int numOfAchievements;
  final int perSuarh;
  const Part(this.numOfSurah, this.numOfAchievements, this.perSuarh,
      {super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        double amount = 0;
        if (numOfAchievements <= 0) {
          amount = 2;
        } else if (numOfAchievements >= perSuarh) {
          amount = w / 1.5 - 2;
        } else {
          amount = (w / 1.5) * (numOfAchievements / perSuarh);
        }
        double brownWidth = amount;
        double blackWidth = w / 1.5 - amount;
        return GestureDetector(
          onTap: () async {
            value.changeNumOfCurrent(numOfSurah);
            log(numOfSurah.toString());
            value.setListForCurrent();
          },
          child: Container(
            width: w * 17 / 20,
            height: h * 7 / 31,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              gradient: value.isDarkTheme == 1
                  ? const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 7, 66, 22),
                        Color.fromARGB(255, 14, 94, 34),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                    )
                  : LinearGradient(
                      colors: [
                        Colors.purple.shade300,
                        Colors.blue.shade500,
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
                    ? const Color.fromARGB(255, 18, 18, 18)
                    : Colors.black,
              ),
              color: value.isDarkTheme == 1
                  ? const Color.fromARGB(255, 14, 94, 34)
                  : Colors.blue.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'suarh'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade400
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                        color: value.isDarkTheme == 1
                            ? const Color.fromARGB(255, 18, 18, 18)
                            : Colors.grey.shade300,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          numOfSurah.toString(),
                          style: TextStyle(
                            fontSize: 11,
                            decoration: TextDecoration.none,
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade400
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: (context.locale == const Locale('en')) ? 0 : 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      numOfAchievements.toString(),
                      style: TextStyle(
                        fontSize:
                            (context.locale == const Locale('en')) ? 38 : 26,
                        decoration: TextDecoration.none,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade400
                            : Colors.black,
                      ),
                    ),
                    Text(
                      (context.locale == const Locale('en'))
                          ? quran.getSurahNameArabic(numOfSurah)
                          : quran.getSurahName(numOfSurah),
                      style: GoogleFonts.arefRuqaa(
                        textStyle: TextStyle(
                          fontSize:
                              (context.locale == const Locale('en')) ? 38 : 26,
                          decoration: TextDecoration.none,
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade400
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: (context.locale == const Locale('en')) ? 0 : 15,
                ),
                Text(
                  'bloodAchievement'.tr(),
                  style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade400
                        : Colors.black,
                  ),
                ),
                SizedBox(
                  height: (context.locale == const Locale('en')) ? 0 : 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$perSuarh\\$numOfAchievements',
                      style: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade400
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 13,
                      width: blackWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                        color: value.isDarkTheme == 1
                            ? const Color.fromARGB(255, 18, 18, 18)
                            : Colors.grey.shade300,
                      ),
                    ),
                    Container(
                      height: 13,
                      width: brownWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                        color: value.isDarkTheme == 1
                            ? Colors.brown.shade900
                            : Colors.brown.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
