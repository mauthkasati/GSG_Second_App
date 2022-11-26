import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/categories.dart';
import 'package:gsg_second_project/enums_lists_maps/staticInfoSurahs.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:gsg_second_project/screens/updateNoteScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import 'package:easy_localization/easy_localization.dart';

class UpdateForm extends StatelessWidget {
  final int verseID;
  final String cat;
  final String noteText;
  final myController = TextEditingController();
  final int sID;

  UpdateForm(this.verseID, this.cat, this.noteText, this.sID, {super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        String dropdownValue = categoriesList.first;
        String ddv2 = versesList[value.numOfCurrent - 1].first.toString();
        return Container(
          padding: const EdgeInsets.all(30),
          height: h * 5.2 / 7,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.centerRight,
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
                  SizedBox(
                      width: (context.locale == const Locale('en'))
                          ? w / 2.9
                          : w / 4.9),
                  Align(
                    alignment: Alignment.centerLeft,
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
                  SizedBox(width: w / 28),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        borderRadius: BorderRadius.circular(10)),
                    width: w / 4,
                    height: 40,
                    child: Center(
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 14,
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade600
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
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
                    width: w / 4,
                    height: 40,
                    child: Center(
                      child: Text(
                        verseID.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade600
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: (context.locale == const Locale('en'))
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  ' : ${'beforeUpdate'.tr()}',
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
                padding: const EdgeInsets.all(20),
                height: h / 5.8,
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
                child: Center(
                  child: Text(
                    noteText,
                    style: TextStyle(
                      fontSize: 14,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade600
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: (context.locale == const Locale('en'))
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  ' : ${'afterUpdate'.tr()}',
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
                padding: const EdgeInsets.all(20),
                height: h / 5.8,
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
                  style: TextStyle(
                    fontSize: 14,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade600
                        : Colors.black,
                  ),
                  minLines: 5,
                  maxLines: 50,
                ),
              ),
              const SizedBox(height: 15),
              FloatingActionButton(
                backgroundColor: value.isDarkTheme == 1
                    ? const Color.fromARGB(255, 18, 18, 18)
                    : Colors.blue.shade200,
                onPressed: () {
                  SqlHelper.dbh.updateData("""
                                          update notes 
                                          set noteText = '${myController.text}'  
                                          where verseID = $verseID and category = '$cat'
                                          """);
                  value.setListForCurrent();
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UpdateNoteScreen(verseID, cat, noteText, sID),
                    ),
                  );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OneNoteScreen(cat, verseID, noteText, sID),
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Center(
                          child: Text((context.locale == const Locale('en'))
                              ? "تم التعديل بنجاح"
                              : "Updated Successfully")),
                      content: const Icon(
                        Icons.check_circle_outline,
                        size: 30,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text((context.locale == const Locale('en'))
                              ? "حسناً"
                              : "OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.update,
                  color: value.isDarkTheme == 1
                      ? Colors.grey.shade500
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
