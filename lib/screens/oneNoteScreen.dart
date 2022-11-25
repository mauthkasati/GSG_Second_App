import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/widgets/oneNoteWidgets/bodyOfOneNoteScreen.dart';
import 'package:gsg_second_project/widgets/oneNoteWidgets/topOfOneNoteScreen.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class OneNoteScreen extends StatelessWidget {
  final String cat;
  final int verseID;
  final String noteText;
  final int sID;

  const OneNoteScreen(this.cat, this.verseID, this.noteText, this.sID,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopOfOneNoteScreen(cat, verseID, noteText, sID),
                Container(
                  height: h * 6 / 7,
                  width: w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'ملاحظة على سورة ${quran.getSurahNameArabic(value.numOfCurrent)}',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        BodyOfOneNoteScreen(cat, verseID, noteText, sID),
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
