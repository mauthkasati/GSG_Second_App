import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/providers/p.dart';
import 'package:gsg_second_project/screens/AllAchievements.dart';
import 'package:gsg_second_project/screens/aboutSurah.dart';
import 'package:gsg_second_project/screens/achievements.dart';
import 'package:gsg_second_project/screens/addNoteScreen.dart';
import 'package:gsg_second_project/screens/deleteNoteScreen.dart';
import 'package:gsg_second_project/screens/firstScreen.dart';
import 'package:gsg_second_project/screens/loginScreen.dart';
import 'package:gsg_second_project/screens/mainScreen.dart';
import 'package:gsg_second_project/screens/oneNoteScreen.dart';
import 'package:gsg_second_project/screens/readSurah.dart';
import 'package:gsg_second_project/screens/updateNoteScreen.dart';
import 'package:gsg_second_project/sqlHelper.dart';
import 'package:gsg_second_project/widgets/updateNoteScreenWidgets/updateForm.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as quran;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SqlHelper.dbh.initDB();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => P()),
        ChangeNotifierProvider(
          create: (context) => MainScreenProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const FirstScreen(),
    );
  }
}
