import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/enums_lists_maps/categories.dart';
import 'package:gsg_second_project/enums_lists_maps/staticInfoSurahs.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:gsg_second_project/screens/updateNoteScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

class UpdateForm extends StatelessWidget {
  final int verseID;
  final String cat;
  final String noteText;
  final myController = TextEditingController();
  final int sID;

  UpdateForm(this.verseID, this.cat, this.noteText, this.sID, {super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        String dropdownValue = categoriesList.first;
        String ddv2 = versesList[value.numOfCurrent - 1].first.toString();
        return Container(
          padding: const EdgeInsets.all(20),
          height: h * 5 / 7,
          width: w * 5 / 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 18, 18, 18),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' :  التصنيف',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  SizedBox(width: w / 2.9),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ' :  رقم الاية',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  SizedBox(width: w / 28),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade600,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    width: w / 4,
                    height: 40,
                    child: Center(
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade600,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: w / 4,
                    height: 40,
                    child: Center(
                      child: Text(
                        verseID.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ' :  قبل التعديل',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: h / 5.8,
                width: w * 4 / 6,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade600,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    noteText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ' :  بعد التعديل',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: h / 5.8,
                width: w * 4 / 6,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade600,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: myController,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                  minLines: 5,
                  maxLines: 50,
                ),
              ),
              const SizedBox(height: 15),
              FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                onPressed: () {
                  SqlHelper.dbh.updateData("""
                                          update notes 
                                          set noteText = '${myController.text}'  
                                          where verseID = $verseID and category = '$cat'
                                          """);
                  value.setListForCurrent();
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UpdateNoteScreen(verseID, cat, noteText, sID),
                    ),
                  );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OneNoteScreen(cat, verseID, noteText, sID),
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Center(child: Text("تم التعديل بنجاح")),
                      content: Icon(
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
                  Icons.update,
                  color: Colors.grey.shade500,
                  size: 35,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
