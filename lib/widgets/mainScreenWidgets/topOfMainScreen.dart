// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/achievements.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:gsg_second_project/widgets/mainScreenWidgets/oneSmallIcon.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

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
          color: const Color.fromARGB(255, 30, 30, 30),
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
                    'غريب',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: Colors.green.shade500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OneSmallIcon(
                        Icons.auto_stories,
                        value.numOfReadedSurahs.toString(),
                        Colors.blue,
                      ),
                      const SizedBox(width: 7),
                      OneSmallIcon(
                        Icons.bolt,
                        value.numOfAll.toString(),
                        Colors.yellow,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                //******************** */
                height: 66,
                width: 66,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 18, 18, 18),
                      width: 2,
                    ),
                    color: const Color.fromARGB(255, 15, 100, 50),
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
              )
            ],
          ),
        );
      }),
    );
  }
}
