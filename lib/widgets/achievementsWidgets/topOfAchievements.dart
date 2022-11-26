import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/achievements.dart';
import 'package:gsg_second_project/screens/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class TopofAchievements extends StatelessWidget {
  // final List<Map<dynamic, dynamic>> d;
  // final List<Map<dynamic, dynamic>> d2;
  // final List<Map<dynamic, dynamic>> d3;
  const TopofAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Container(
          height: h / 6,
          width: w,
          padding: EdgeInsets.only(top: w / 16, left: w / 16, right: w / 16),
          // margin: const EdgeInsets.only(bottom: 15),
          color: value.isDarkTheme == 1
              ? const Color.fromARGB(255, 15, 100, 50)
              : Colors.brown.shade500,
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Achievements(),
                        ),
                      );
                    },
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: value.isDarkTheme == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'achievementsTop'.tr(),
                          style: TextStyle(
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade400
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'assets/images/badge2.png',
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        value.setColor3();
                        value.setChosenList3();
                      },
                      child: Container(
                        height: h / 30,
                        width: w / 5,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: value.c3,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade400
                                : Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'surah'.tr(),
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
                    GestureDetector(
                      onTap: () {
                        value.setColor2();
                        value.setChosenList2();
                      },
                      child: Container(
                        height: h / 30,
                        width: w / 5,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: value.c2,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade400
                                : Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'writer'.tr(),
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
                    GestureDetector(
                      onTap: () {
                        value.setChosenList1();
                        value.setColor1();
                      },
                      child: Container(
                        height: h / 30,
                        width: w / 5,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: value.c,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: value.isDarkTheme == 1
                                ? Colors.grey.shade400
                                : Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'all'.tr(),
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
