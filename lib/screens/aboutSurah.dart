import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/widgets/aboutSurahWidgets/textOfAboutSurah.dart';
import 'package:gsg_second_project/widgets/aboutSurahWidgets/topOfAboutSurah.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutSurah extends StatelessWidget {
  int num = 0;
  AboutSurah(int n, {super.key}) {
    num = n;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Scaffold(
          backgroundColor: value.isDarkTheme == 1
              ? Colors.grey.shade900
              : Colors.green.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopOfAboutSurah(2),
                TextofAboutSurah(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
