import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/widgets/readSurahWidget.dart/textOfSurah.dart';
import 'package:gsg_second_project/widgets/readSurahWidget.dart/topOfReadSurah.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class ReadSurah extends StatelessWidget {
  int numOfSurah = 1;

  ReadSurah(int n, {super.key}) {
    numOfSurah = n;
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(builder: ((context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopOfReadSyrah(),
              SizedBox(
                width: w,
                height: h * 0.5 / 7,
                child: Center(
                  child: Text(
                    quran.basmala,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              TextOfSurah(numOfSurah),
            ],
          ),
        ),
      );
    }));
  }
}
