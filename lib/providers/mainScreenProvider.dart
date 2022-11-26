import 'package:flutter/cupertino.dart';
import 'package:gsg_second_project/enums_lists_maps/categories.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:quran/quran.dart' as quran;

class MainScreenProvider extends ChangeNotifier {
  int isDarkTheme = 1;
  int chosenList = 1;
  int numOfCurrent = 114;
  int numOfAll = 0;
  int numOfReadedSurahs = 0;
  int numSession = 0;
  int numOfAchPerSurah = 0;
  String firstCharOfName = 'م';
  String dropVal1 = categoriesList.first;
  String dropVal2 = 'def';
  List<Map<String, dynamic>> achievementTable = [];
  List<Map<String, dynamic>> notesTable = [];
  List<Map<String, dynamic>> listForCurrent = [];
  List<Map<String, dynamic>> numOfAllList = [];
  List<Map<String, dynamic>> numOfReadedSurahsList = [];
  List<Map<String, dynamic>> numOfAchPerSurahList = [];
  List<Map<String, dynamic>> forPartWidgetList = [];
  List<Map<String, dynamic>> chosenListContent = [];
  // List<Map<String, dynamic>> perSurahTable =
  //     SqlHelper.dbh.readData('select * from perSurah');
  setTheme() async {
    List<Map> temp = await SqlHelper.dbh.readData('select * from single');
    int isDark = temp[0]['id'];
    // print('isDark = $isDark');
    if (isDark == 1) {
      await SqlHelper.dbh.updateData('update single set id = 0');
      isDarkTheme = 0;
      // print('if if if if if if ');
    } else {
      await SqlHelper.dbh.updateData('update single set id =1');
      isDarkTheme = 1;
      // print('else else else ');
    }
    notifyListeners();
  }

  setChosenList1() async {
    chosenListContent = await SqlHelper.dbh.readData(
      'select * from achievements',
    );
    notifyListeners();
  }

  setChosenList2() async {
    chosenListContent = await SqlHelper.dbh.readData(
      "select * from achievements where firstChar='$firstCharOfName'",
    );
    notifyListeners();
  }

  setChosenList3() async {
    chosenListContent = await SqlHelper.dbh.readData(
      "select * from achievements where surah = '${quran.getSurahNameArabic(numOfCurrent)}'",
    );
    notifyListeners();
  }

  increaseNumSession() {
    numSession++;
    notifyListeners();
  }

  decreaseNumSession() {
    numSession--;
    notifyListeners();
  }

  setGeneral() async {
    chosenListContent = await SqlHelper.dbh.readData(
      'select * from achievements',
    );
    numOfAllList = await SqlHelper.dbh.readData(
      'select count(*) from notes',
    );
    numOfAll = numOfAllList[0]['count(*)'] ?? 0;
    // ignore: avoid_print
    print('11111   $numOfAll');

    numOfReadedSurahsList = await SqlHelper.dbh.readData(
      'select count(DISTINCT surahID) from notes',
    );
    numOfReadedSurahs =
        numOfReadedSurahsList[0]['count(DISTINCT surahID)'] ?? 0;
    // ignore: avoid_print
    print('22222  $numOfReadedSurahs');

    numOfAchPerSurahList = await SqlHelper.dbh.readData(
      'select count(*) from perSurah where numOfAchPerSurah > 0',
    );
    numOfAchPerSurah = numOfAchPerSurahList[0]['numOfAchPerSurah'] ?? 0;
    print('3333   $numOfAchPerSurah');
    forPartWidgetList = await SqlHelper.dbh.readData(
      'select * from perSurah',
    );
    notifyListeners();
  }

  setListForCurrent() async {
    listForCurrent = await SqlHelper.dbh.readData(
      "select * from notes where surahID = $numOfCurrent",
    );
    notifyListeners();
  }

  setLists() async {
    chosenListContent = await SqlHelper.dbh.readData(
      'select * from achievements',
    );
    achievementTable = await SqlHelper.dbh.readData(
      "select * from achievements",
    );
    notesTable = await SqlHelper.dbh.readData(
      "select * from notes",
    );
    // perSurahTable = await SqlHelper.dbh.readData(
    //   "select * from notes",
    // );
    numOfAllList = await SqlHelper.dbh.readData(
      "select count(id) from notes",
    );
    numOfReadedSurahsList = await SqlHelper.dbh.readData(
      "select count(DISTINCT verseID) from notes",
    );
    notifyListeners();
  }

  changeDropVal1(String str) {
    dropVal1 = str;
    notifyListeners();
  }

  changeDropVal2(String str) {
    dropVal2 = str;
    notifyListeners();
  }

  changeNumOfCurrent(int n) {
    numOfCurrent = n;
    notifyListeners();
  }

  changeFirstChar(String s) {
    firstCharOfName = s[0];
    notifyListeners();
  }

  Color c = const Color.fromARGB(255, 95, 60, 8);
  Color c2 = const Color.fromARGB(255, 15, 100, 50);
  Color c3 = const Color.fromARGB(255, 15, 100, 50);
  setColor1() {
    c = const Color.fromARGB(255, 95, 60, 8);
    c2 = const Color.fromARGB(255, 15, 100, 50);
    c3 = const Color.fromARGB(255, 15, 100, 50);
    notifyListeners();
  }

  setColor2() {
    c = const Color.fromARGB(255, 15, 100, 50);
    c2 = const Color.fromARGB(255, 95, 60, 8);
    c3 = const Color.fromARGB(255, 15, 100, 50);
    notifyListeners();
  }

  setColor3() {
    c = const Color.fromARGB(255, 15, 100, 50);
    c2 = const Color.fromARGB(255, 15, 100, 50);
    c3 = const Color.fromARGB(255, 95, 60, 8);
    notifyListeners();
  }
}
