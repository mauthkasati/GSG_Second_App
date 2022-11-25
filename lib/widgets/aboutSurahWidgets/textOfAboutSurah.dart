import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/aboutSurahList.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class TextofAboutSurah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: (context, value, child) {
        return Container(
          height: h * 5.5 / 7,
          width: w,
          padding: const EdgeInsets.all(30),
          color: Colors.grey.shade900,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 15, 100, 50),
              ),
              color: const Color.fromARGB(255, 18, 18, 18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                aboutSurahList[value.numOfCurrent],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
