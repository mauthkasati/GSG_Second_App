// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/achievements.dart';
import 'package:gsg_second_project/screens/firstScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:gsg_second_project/widgets/mainScreenWidgets/oneSmallIcon.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:easy_localization/easy_localization.dart';

class TopOfMainScreen extends StatelessWidget {
  const TopOfMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Container(
          height: h * 6 / 32,
          width: w,
          padding: EdgeInsets.all(w / 20),
          color: value.isDarkTheme == 1
              ? const Color.fromARGB(255, 30, 30, 30)
              : Colors.green.shade200,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: GestureDetector(
                  child: Image.asset('assets/images/badge.png'),
                  onTap: () async {
                    value.setChosenList1();
                    // value.setGeneral();
                    // await value.setLists();
                    // await SqlHelper.dbh.deleteData('delete from notes');
                    // await SqlHelper.dbh.deleteData('delete from achievements');
                    // await SqlHelper.dbh.updateData(
                    //   'update perSurah set numOfAchPerSurah=0',
                    // );
                    // List<Map> li = await SqlHelper.dbh.readData(
                    //   'select * from achievements',
                    // );
                    // print(li);
                    // List<Map> li1 = await SqlHelper.dbh.readData(
                    //   'select * from achievements',
                    // );
                    // List<Map> li2 = await SqlHelper.dbh.readData(
                    //   "select * from achievements where firstChar='${value.firstCharOfName}'",
                    // );
                    // List<Map> li3 = await SqlHelper.dbh.readData(
                    //   "select * from achievements where surah = '${quran.getSurahName(value.numOfCurrent)}'",
                    // );
                    // ignore: avoid_print
                    // print(li2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Achievements(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: w / 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    (context.locale == const Locale('en')) ? 'غريب' : 'Gareeb',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: value.isDarkTheme == 1
                          ? Colors.green.shade500
                          : Colors.grey.shade900,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OneSmallIcon(
                        Icons.auto_stories,
                        value.numOfReadedSurahs.toString(),
                        Colors.blue.shade900,
                      ),
                      const SizedBox(width: 7),
                      OneSmallIcon(
                        Icons.bolt,
                        value.numOfAll.toString(),
                        Colors.yellow.shade900,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstScreen(),
                    ),
                  );
                },
                child: Container(
                  //******************** */
                  height: 66,
                  width: 66,
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
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              )
                            : BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                      ],
                      border: Border.all(
                        color: Color.fromARGB(255, 18, 18, 18),
                        width: 1,
                      ),
                      color: value.isDarkTheme == 1
                          ? const Color.fromARGB(255, 15, 100, 50)
                          : Colors.blue.shade700,
                      //************************
                      borderRadius: BorderRadius.circular(33)
                      //more than 50% of width makes circle
                      ),
                  child: Center(
                    child: Text(
                      value.firstCharOfName,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
