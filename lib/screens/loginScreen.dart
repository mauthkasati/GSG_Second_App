import 'dart:async';
import 'dart:developer';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:gsg_second_project/drow.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:gsg_second_project/screens/mainScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: h,
                      width: w / 35,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                      ),
                    ),
                    Container(
                      height: h,
                      width: w * 34 / 35,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 15, 100, 50),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h / 1.7,
                            width: w * 34 / 35,
                            child: Image.asset(
                              'assets/images/loginImage.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: h / 26,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: h / 20,
                                width: w / 1.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade900,
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: myController,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w / 8.5,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(
                                        380,
                                        (380 * 0.5833333333333334)
                                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                    painter: RPSCustomPainter(),
                                  ),
                                  Positioned(
                                    top: 47,
                                    left: 8,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 38,
                                    child: IconButton(
                                      onPressed: () async {
                                        await value.setLists();
                                        value.setGeneral();
                                        value.changeFirstChar(
                                          myController.text,
                                        );
                                        value.setTheme;
                                        // ignore: use_build_context_synchronously
                                        Timer(
                                          const Duration(milliseconds: 600),
                                          () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainScreen(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 17,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
