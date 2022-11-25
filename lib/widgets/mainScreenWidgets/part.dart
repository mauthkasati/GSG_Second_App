// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

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
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 18, 18, 18),
              ),
              color: const Color.fromARGB(255, 14, 94, 34),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'سورة',
                      style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 18, 18, 18),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          numOfSurah.toString(),
                          style: TextStyle(
                            fontSize: 11,
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        numOfAchievements.toString(),
                        style: TextStyle(
                          fontSize: 38,
                          decoration: TextDecoration.none,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        quran.getSurahNameArabic(numOfSurah),
                        style: TextStyle(
                          fontSize: 38,
                          decoration: TextDecoration.none,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'نسبة الانجاز',
                  style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    color: Colors.grey.shade400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$perSuarh\\$numOfAchievements',
                      style: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 13,
                      width: blackWidth,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                        color: Color.fromARGB(255, 18, 18, 18),
                      ),
                    ),
                    Container(
                      height: 13,
                      width: brownWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                        color: Colors.brown.shade900,
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
