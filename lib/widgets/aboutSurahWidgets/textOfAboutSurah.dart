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
          color: value.isDarkTheme == 1
              ? Colors.grey.shade900
              : Colors.green.shade200,
          child: Container(
            padding: const EdgeInsets.all(30),
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      )
                    : BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
              ],
              border: Border.all(
                width: 1,
                color: value.isDarkTheme == 1
                    ? const Color.fromARGB(255, 15, 100, 50)
                    : Colors.black,
              ),
              color: value.isDarkTheme == 1
                  ? const Color.fromARGB(255, 18, 18, 18)
                  : Colors.blue.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                aboutSurahList[value.numOfCurrent],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: value.isDarkTheme == 1
                      ? Colors.grey.shade400
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
