import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/widgets/aboutSurahWidgets/textOfAboutSurah.dart';
import 'package:gsg_second_project/widgets/aboutSurahWidgets/topOfAboutSurah.dart';

class AboutSurah extends StatelessWidget {
  int num = 0;
  AboutSurah(int n, {super.key}) {
    num = n;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopOfAboutSurah(2),
            TextofAboutSurah(),
          ],
        ),
      ),
    );
  }
}
