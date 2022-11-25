import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/mainScreen.dart';
import 'package:gsg_second_project/screens/readSurah.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class TopOfReadSyrah extends StatelessWidget {
  const TopOfReadSyrah({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        String name = quran.getSurahNameArabic(value.numOfCurrent);
        int numOfVerses = quran.getVerseCount(value.numOfCurrent);
        return Container(
          padding: const EdgeInsets.all(15),
          width: w,
          height: h / 7,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 95, 60, 8),
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
                        builder: (context) => ReadSurah(value.numOfCurrent),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey.shade200,
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
                      "اقرا سورة $name",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 28,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Text(
                      "سورة $name _ $numOfVerses ايات",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        color: Colors.grey.shade200,
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
