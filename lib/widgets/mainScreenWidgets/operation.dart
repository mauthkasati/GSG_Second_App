import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/aboutSurah.dart';
import 'package:gsg_second_project/screens/addNoteScreen.dart';
import 'package:gsg_second_project/screens/allAchievements.dart';
import 'package:gsg_second_project/screens/deleteNoteScreen.dart';
import 'package:gsg_second_project/screens/readSurah.dart';
import 'package:gsg_second_project/screens/testYourself.dart';
import 'package:gsg_second_project/screens/updateNoteScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Operation extends StatelessWidget {
  final String str;
  final String text;
  final IconData? iconData;
  final int op;
  const Operation(this.str, this.text, this.iconData, this.op, {super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(builder: ((context, value, child) {
      return Container(
        height: h * 3 / 32,
        width: w * 3 / 4,
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 25, right: 25),
        margin: const EdgeInsets.all(8),
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
                    Color.fromARGB(255, 149, 113, 197),
                    Colors.blue.shade300,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.center,
                ),
          boxShadow: [
            value.isDarkTheme == 1
                ? BoxShadow(
                    color: Colors.grey.shade700.withOpacity(0.0),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(0, 3), // changes position of shadow
                  )
                : BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
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
              : Colors.blue.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () async {
                  if (op == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadSurah(value.numOfCurrent),
                      ),
                    );
                  } else if (op == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutSurah(value.numOfCurrent),
                      ),
                    );
                  } else if (op == 3) {
                    value.setListForCurrent();
                    // List<Map> y = await SqlHelper.dbh.readData(
                    //   "select * from notes where surahID = ${value.numOfCurrent}",
                    // );
                    // print(y);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllAchievements(),
                      ),
                    );
                  } else if (op == 4) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AddNoteScreen(),
                    //   ),
                    // );
                  } else if (op == 5) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UpdateNoteScreen(),
                    //   ),
                    // );
                  } else if (op == 6) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DeleteNoteScreen(),
                    //   ),
                    // );
                  } else if (op == 7) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const TestYourself(),
                    //   ),
                    // );
                  }
                },
                child: Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: value.isDarkTheme == 1
                          ? const Color.fromARGB(255, 15, 100, 50)
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade800
                        : Colors.grey.shade300,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      str,
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.none,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade400
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade600
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: value.isDarkTheme == 1
                          ? Colors.green.shade800
                          : Colors.blue.shade900,
                    ),
                    child: Icon(
                      iconData,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade400
                          : Colors.yellow.shade900,
                      size: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
