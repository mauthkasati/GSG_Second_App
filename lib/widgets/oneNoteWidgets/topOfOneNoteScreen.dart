import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/allAchievements.dart';
import 'package:gsg_second_project/screens/mainScreen.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class TopOfOneNoteScreen extends StatelessWidget {
  final String cat;
  final int verseID;
  final String noteText;
  final int sID;

  const TopOfOneNoteScreen(this.cat, this.verseID, this.noteText, this.sID,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 40),
          padding: const EdgeInsets.all(15),
          width: w,
          height: h / 7,
          decoration: BoxDecoration(
            color: value.isDarkTheme == 1
                ? const Color.fromARGB(255, 95, 60, 8)
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
                        builder: (context) =>
                            OneNoteScreen(cat, verseID, noteText, sID),
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
                      "yourNote".tr(),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 28,
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
