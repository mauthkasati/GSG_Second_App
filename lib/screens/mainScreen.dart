import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/staticInfoSurahs.dart';
import 'package:gsg_second_project/enums_lists_maps/tabels.dart';
import 'package:gsg_second_project/models/surahModel.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:gsg_second_project/widgets/mainScreenWidgets/dones.dart';
import 'package:gsg_second_project/widgets/mainScreenWidgets/operation.dart';
import 'package:gsg_second_project/widgets/mainScreenWidgets/part.dart';
import 'package:gsg_second_project/widgets/mainScreenWidgets/topOfMainScreen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Consumer<MainScreenProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          Scaffold(
            body: Container(
              color: value.isDarkTheme == 1
                  ? const Color.fromARGB(255, 30, 30, 30)
                  : Colors.green.shade200,
              child: Column(
                children: [
                  const TopOfMainScreen(),
                  Dones(),
                  const SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(
                      right: (context.locale == const Locale('en')) ? 40 : 0,
                      left: (context.locale == const Locale('en')) ? 0 : 40,
                    ),
                    child: Align(
                      alignment: (context.locale == const Locale('en'))
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        'allSurahs'.tr(),
                        style: TextStyle(
                          fontSize: 22,
                          decoration: TextDecoration.none,
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade400
                              : const Color.fromARGB(255, 18, 18, 18),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: numsOfSurahsList.map((e) {
                        return Part(
                          e,
                          value.forPartWidgetList[e - 1]['numOfAchPerSurah'],
                          numOfVerses[e - 1],
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: (context.locale == const Locale('en')) ? 40 : 0,
                      left: (context.locale == const Locale('en')) ? 0 : 40,
                    ),
                    child: Align(
                      alignment: (context.locale == const Locale('en'))
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        'think'.tr(),
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade400
                              : const Color.fromARGB(255, 18, 18, 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    height: h * 6.22 / 19,
                    width: w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Operation('read'.tr(), 'readSurah'.tr(),
                              Icons.auto_stories, 1),
                          SizedBox(width: 10),
                          Operation('know'.tr(), 'knowAboutSurah'.tr(),
                              Icons.book, 2),
                          SizedBox(width: 10),
                          Operation('read'.tr(), 'allAch'.tr(), Icons.list, 3),
                          // SizedBox(width: 10),
                          // Operation('أضف', 'أضف ملاحظاتك', Icons.add, 4),
                          // SizedBox(width: 10),
                          // Operation('عدل', 'عدل ملاحظاتك', Icons.update, 5),
                          // SizedBox(width: 10),
                          // Operation('احذف', 'احذف ملاحظاتك', Icons.delete, 6),
                          SizedBox(width: 10),
                          Operation('اختبر', 'اختبر نفسك ', Icons.quiz, 7),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade500
                        : Colors.blue.shade900,
                    width: 1,
                  )),
              child: FloatingActionButton(
                hoverColor: Colors.amber,
                splashColor: Colors.purple,
                backgroundColor: value.isDarkTheme == 1
                    ? Colors.brown.shade900
                    : Colors.brown.shade500,
                onPressed: () async {
                  // await SqlHelper.dbh.insertData(
                  //   'insert into single values (1)',
                  // );
                  // List<Map> themeList = await SqlHelper.dbh.readData(
                  //   'select * from single',
                  // );
                  // print(themeList[0]['id']);
                  value.setTheme();
                },
                child: Icon(
                  value.isDarkTheme == 1 ? Icons.light_mode : Icons.dark_mode,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade500
                        : Colors.blue.shade900,
                    width: 1,
                  )),
              child: FloatingActionButton(
                hoverColor: Colors.amber,
                splashColor: Colors.purple,
                backgroundColor: value.isDarkTheme == 1
                    ? Colors.brown.shade900
                    : Colors.brown.shade500,
                onPressed: () {
                  print(context.locale);
                  if (context.locale == const Locale('ar')) {
                    context.setLocale(const Locale('en'));
                    log('11111111');
                  } else {
                    context.setLocale(const Locale('ar'));
                    log('2222222');
                  }
                  print(context.locale);
                },
                child: const Icon(Icons.language),
              ),
            ),
          ),
        ],
      );
    });
  }
}
