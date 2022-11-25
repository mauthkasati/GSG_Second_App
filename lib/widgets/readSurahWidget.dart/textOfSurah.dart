import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/screens/addNoteScreen.dart';
import 'package:quran/quran.dart' as quran;

class TextOfSurah extends StatelessWidget {
  int num = 0;
  TextOfSurah(int n, {super.key}) {
    num = n;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 5.5 / 7,
      width: w,
      padding: const EdgeInsets.all(15),
      color: Colors.grey.shade900,
      child: ListView.builder(
        itemCount: quran.getVerseCount(num),
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 18, 18, 18),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 15, 100, 50),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                style: const ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNoteScreen(index + 1),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      quran.getVerse(
                        num,
                        index + 1,
                        verseEndSymbol: true,
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
