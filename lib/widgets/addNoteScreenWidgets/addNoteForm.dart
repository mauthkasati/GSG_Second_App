import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/categories.dart';
import 'package:gsg_second_project/enums_lists_maps/staticInfoSurahs.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/addNoteScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:easy_localization/easy_localization.dart';

class AddNoteForm extends StatelessWidget {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final int ind;
  AddNoteForm(this.ind, {super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        String dropdownValue = categoriesList.first;
        String ddv2 = versesList[value.numOfCurrent - 1].first.toString();
        return Container(
          padding: const EdgeInsets.all(20),
          height: h * 5 / 7,
          width: w * 5 / 6,
          decoration: BoxDecoration(
            gradient: value.isDarkTheme == 1
                ? const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 2, 32, 9),
                      Color.fromARGB(255, 14, 94, 34),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                  : BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: value.isDarkTheme == 1
                ? const Color.fromARGB(255, 18, 18, 18)
                : Colors.blue.shade700,
          ),
          child: Column(
            children: [
              Align(
                alignment: (context.locale == const Locale('en'))
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  'cat'.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: value.isDarkTheme == 1
                      ? Colors.grey.shade900
                      : Colors.blue.shade300,
                  border: Border.all(
                    width: 1,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: w / 3,
                height: 40,
                child: TextField(
                  controller: myController2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                // child: Align(
                //   alignment: Alignment.center,
                //   child: DropdownButton<String>(
                //     isExpanded: true,
                //     dropdownColor: Colors.grey.shade300,
                //     menuMaxHeight: 200,
                //     value: dropdownValue,
                //     icon: const Icon(
                //       Icons.arrow_drop_down,
                //       size: 25,
                //     ),
                //     style: TextStyle(
                //       fontSize: 16,
                //       color: Colors.grey.shade600,
                //     ),
                //     onChanged: (String? v) {
                //       dropdownValue = v!;
                //       log(dropdownValue);
                //     },
                //     items: categoriesList.map<DropdownMenuItem<String>>(
                //       (String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Align(
                //             alignment: Alignment.center,
                //             child: Text(value),
                //           ),
                //         );
                //       },
                //     ).toList(),
                //   ),
                // ),
              ),
              Align(
                alignment: (context.locale == const Locale('en'))
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  'verseNum'.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade900
                        : Colors.blue.shade300,
                    border: Border.all(
                      width: 1,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade600
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: w / 3,
                  height: 40,
                  child: Center(
                    child: Text(
                      '$ind',
                      style: TextStyle(
                        fontSize: 14,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade600
                            : Colors.black,
                      ),
                    ),
                  )),
              Align(
                alignment: (context.locale == const Locale('en'))
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  'writeNote'.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(20),
                height: h / 3.5,
                width: w * 4 / 6,
                decoration: BoxDecoration(
                  color: value.isDarkTheme == 1
                      ? Colors.grey.shade900
                      : Colors.blue.shade300,
                  border: Border.all(
                    width: 1,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  maxLines: 20,
                  style: TextStyle(
                    fontSize: 16,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FloatingActionButton(
                backgroundColor: value.isDarkTheme == 1
                    ? const Color.fromARGB(255, 18, 18, 18)
                    : Colors.blue.shade300,
                onPressed: () async {
                  int response = await SqlHelper.dbh.insertData(
                    """
                      insert into notes (surahID,category,verseID,noteText)
                      values(
                        '${value.numOfCurrent.toString()}',
                        '${myController2.text}',
                        '$ind',
                        '${myController.text}'
                        )
                      """,
                  );
                  int response2 = await SqlHelper.dbh.insertData(
                    """
                      insert into achievements (firstChar,verse,surah)
                      values(
                        '${value.firstCharOfName}',
                        '$ind',
                        '${quran.getSurahNameArabic(value.numOfCurrent)}'
                        )
                      """,
                  );
                  int response3 = await SqlHelper.dbh.insertData(
                    """
                      update perSurah 
                      set numOfAchPerSurah = numOfAchPerSurah+1 
                      where id = ${value.numOfCurrent}
                    """,
                  );
                  value.increaseNumSession();
                  value.setGeneral();
                  log(value.numSession.toString() + 'hellonsca');
                  // value.setGeneral();
                  log('response massage : $response');
                  log('response massage : $response2');
                  log('response massage : $response3');
                  // ignore: use_build_context_synchronously
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNoteScreen(ind),
                    ),
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Center(
                          child: Text((context.locale == const Locale('en'))
                              ? "تمت الاضافة بنجاح"
                              : "Added Successfully")),
                      content: const Icon(
                        Icons.check_circle_outline,
                        size: 30,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            (context.locale == const Locale('en'))
                                ? "حسناً"
                                : "OK",
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.add,
                  color: value.isDarkTheme == 1
                      ? Colors.grey.shade600
                      : Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
