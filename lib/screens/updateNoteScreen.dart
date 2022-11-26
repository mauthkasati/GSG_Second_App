import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/widgets/achievementsWidgets/oneAchievement.dart';
import 'package:gsg_second_project/widgets/addNoteScreenWidgets/topOfAddNoteScreen.dart';
import 'package:gsg_second_project/widgets/allAchievementsWidget/topOfAllAchievements.dart';
import 'package:gsg_second_project/widgets/deleteNoteScreenWidgets/topfDeleteNoteScreen.dart';
import 'package:gsg_second_project/widgets/updateNoteScreenWidgets/oneOfUpdatedNotes.dart';
import 'package:gsg_second_project/widgets/updateNoteScreenWidgets/updateForm.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;
import '../widgets/allAchievementsWidget/oneOfAllAchievements.dart';
import '../widgets/updateNoteScreenWidgets/topOfUpdateNoteScreen.dart';
import 'package:easy_localization/easy_localization.dart';

class UpdateNoteScreen extends StatelessWidget {
  final int verseID;
  final String cat;
  final String noteText;
  final int sID;
  final myController = TextEditingController();

  UpdateNoteScreen(this.verseID, this.cat, this.noteText, this.sID,
      {super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    int index = 1;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Scaffold(
          backgroundColor: value.isDarkTheme == 1
              ? Colors.grey.shade900
              : Colors.green.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopOfUpdateNoteScreen(verseID, cat, noteText, sID),
                Container(
                  height: h * 6 / 7,
                  width: w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          '${'updateOnSurah'.tr()} ${quran.getSurahNameArabic(value.numOfCurrent)}',
                          style: TextStyle(
                              fontSize: 16,
                              color: value.isDarkTheme == 1
                                  ? Colors.grey.shade50
                                  : Colors.black),
                        ),
                        UpdateForm(verseID, cat, noteText, sID),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
