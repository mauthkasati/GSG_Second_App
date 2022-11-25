import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/categories.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/deleteNoteScreen.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:gsg_second_project/screens/updateNoteScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class BodyOfOneNoteScreen extends StatelessWidget {
  final String cat;
  final int verseID;
  final String noteText;
  final int sID;

  BodyOfOneNoteScreen(this.cat, this.verseID, this.noteText, this.sID,
      {super.key});
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String dropdownValue = categoriesList.first;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: h * 5 / 7,
          width: w * 5 / 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 18, 18, 18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h / 16,
                width: w / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 15, 100, 50),
                  ),
                ),
                child: Center(
                  child: Text(
                    'التصنيف : $cat',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: h / 70),
              Container(
                height: h / 16,
                width: w / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 15, 100, 50),
                  ),
                ),
                child: Center(
                  child: Text(
                    'رقم الاية : $verseID',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' : الملاحظة',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 20,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: h / 3,
                width: w * 4 / 6,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 15, 100, 50),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    noteText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 50,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateNoteScreen(verseID, cat, noteText, sID),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.update,
                      color: Colors.grey.shade500,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: w / 8),
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                    onPressed: () async {
                      await SqlHelper.dbh.deleteData("""
                                          delete from notes 
                                          where verseID = $verseID and category = '$cat'
                                          """);
                      await SqlHelper.dbh.deleteData("""
                                          delete from achievements 
                                          where verse = $verseID and surah = '${quran.getSurahNameArabic(sID)}'
                                          """);
                      await SqlHelper.dbh.updateData(
                        """
                      update perSurah 
                      set numOfAchPerSurah = numOfAchPerSurah-1 
                      where id = ${value.numOfCurrent}
                    """,
                      );

                      value.decreaseNumSession();
                      log(value.numSession.toString());
                      value.setListForCurrent();
                      value.setGeneral();

                      // ignore: use_build_context_synchronously
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OneNoteScreen(
                            cat,
                            verseID,
                            noteText,
                            sID,
                          ),
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(child: Text("تم الحذف بنجاح")),
                          content: const Icon(
                            Icons.check_circle_outline,
                            size: 30,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('حسناً'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey.shade500,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
