import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/aboutSurah.dart';
import 'package:gsg_second_project/screens/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class TopOfAboutSurah extends StatelessWidget {
  int num = 0;
  TopOfAboutSurah(int n, {super.key}) {
    num = n;
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        String name = quran.getSurahNameArabic(value.numOfCurrent);
        return Container(
          padding: EdgeInsets.all(15),
          width: w,
          height: h / 7,
          decoration: BoxDecoration(
            color: value.isDarkTheme == 1
                ? Color.fromARGB(255, 95, 60, 8)
                : Colors.brown.shade500,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutSurah(value.numOfCurrent),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade200
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      " ${'about'.tr()} ${(context.locale == const Locale('en')) ? quran.getSurahNameArabic(value.numOfCurrent) : quran.getSurahName(value.numOfCurrent)}",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 23,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade200
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
