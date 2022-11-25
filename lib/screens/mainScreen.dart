import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/staticInfoSurahs.dart';
import 'package:gsg_second_project/enums_lists_maps/tabels.dart';
import 'package:gsg_second_project/models/surahModel.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
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
      return Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 30, 30, 30),
          child: Column(
            children: [
              const TopOfMainScreen(),
              Dones(),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(right: 40),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'جميع السور',
                    style: TextStyle(
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  textDirection: TextDirection.rtl,
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
                margin: const EdgeInsets.only(right: 40),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'بماذا تفكر ؟',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                height: h * 6.22 / 19,
                width: w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Operation('اقرأ', 'اقرأ السورة', Icons.auto_stories, 1),
                      SizedBox(width: 10),
                      Operation('تعلم', 'تعلم عن السورة', Icons.book, 2),
                      SizedBox(width: 10),
                      Operation('اقرأ', ' كل الملاحظات', Icons.list, 3),
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
      );
    });
  }
}
