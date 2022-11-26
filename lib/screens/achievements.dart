import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/tabels.dart';
import 'package:gsg_second_project/widgets/achievementsWidgets/oneAchievement.dart';
import 'package:gsg_second_project/widgets/achievementsWidgets/topOfAchievements.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Achievements extends StatelessWidget {
  // final List<Map<dynamic, dynamic>> d;
  // final List<Map<dynamic, dynamic>> d2;
  // final List<Map<dynamic, dynamic>> d3;
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        // List<Map<dynamic, dynamic>> myList = [];
        // if (value.chosenList == 3) {
        //   myList = d3;
        // } else if (value.chosenList == 2) {
        //   myList = d2;
        // } else {
        //   myList = d;
        // }
        return Column(
          children: [
            TopofAchievements(),
            Container(
              height: h * 5 / 6,
              width: w,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: value.isDarkTheme == 1
                    ? Colors.grey.shade900
                    : Colors.green.shade200,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: value.chosenListContent.map(
                    ((e) {
                      return OneAchievement(
                        e['id'],
                        e['firstChar'],
                        '${'verseNum'.tr()} ${e['verse']}',
                        e['surah'],
                      );
                    }),
                  ).toList(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
