import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/widgets/achievementsWidgets/oneAchievement.dart';
import 'package:gsg_second_project/widgets/addNoteScreenWidgets/addNoteForm.dart';
import 'package:gsg_second_project/widgets/addNoteScreenWidgets/topOfAddNoteScreen.dart';
import 'package:gsg_second_project/widgets/allAchievementsWidget/topOfAllAchievements.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/allAchievementsWidget/oneOfAllAchievements.dart';
import 'package:quran/quran.dart' as quran;

class AddNoteScreen extends StatelessWidget {
  final int ind;
  const AddNoteScreen(this.ind, {super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        String name = quran.getSurahNameArabic(value.numOfCurrent);
        return Scaffold(
          backgroundColor: value.isDarkTheme == 1
              ? Colors.grey.shade900
              : Colors.green.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopOfAddNoteScreen(ind),
                const SizedBox(height: 25),
                Text(
                  '${'suarh'.tr()} ${(context.locale == const Locale('en')) ? quran.getSurahNameArabic(value.numOfCurrent) : quran.getSurahName(value.numOfCurrent)}',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade500
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                AddNoteForm(ind),
              ],
            ),
          ),
        );
      }),
    );
  }
}
