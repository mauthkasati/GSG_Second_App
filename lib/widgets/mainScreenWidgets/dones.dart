import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Dones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        double amount = 0;
        if (value.numSession <= 0) {
          amount = 2;
        } else if (value.numSession >= 10) {
          amount = w / 2.1 - 2;
        } else {
          amount = (w / 2.1) * (value.numSession / 10);
        }
        double greenWidth = amount;
        double greyWidth = w / 2.1 - amount;
        return Container(
          width: w * 16 / 20,
          height: h / 8,
          padding: EdgeInsets.all(w / 24),
          decoration: BoxDecoration(
            gradient: value.isDarkTheme == 1
                ? const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 10, 10, 10),
                      Color.fromARGB(255, 30, 30, 30),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )
                : LinearGradient(
                    colors: [
                      Colors.purple.shade300,
                      Colors.blue.shade300,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                  ),
            boxShadow: [
              value.isDarkTheme == 1
                  ? BoxShadow(
                      color: Colors.grey.shade700.withOpacity(0.0),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                  : BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
            ],
            border: Border.all(
              width: 1,
              color: value.isDarkTheme == 1
                  ? const Color.fromARGB(255, 15, 100, 50)
                  : Colors.black,
            ),
            borderRadius: BorderRadius.circular(15),
            color: value.isDarkTheme == 1
                ? Color.fromARGB(255, 18, 18, 18)
                : Colors.blue.shade300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 13,
                  width: 25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(7),
                    color: value.isDarkTheme == 1
                        ? Colors.grey.shade800
                        : Colors.grey.shade300,
                  ),
                  child: Center(
                    child: Text(
                      value.numSession.toString(),
                      style: TextStyle(
                        fontSize: 11,
                        decoration: TextDecoration.none,
                        color: value.isDarkTheme == 1
                            ? Colors.grey.shade500
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'achievements'.tr(),
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade500
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: (context.locale == const Locale('en')) ? 0 : 5,
                  ),
                  Text(
                    'continueAch'.tr(),
                    style: TextStyle(
                      fontSize: 11,
                      decoration: TextDecoration.none,
                      color: value.isDarkTheme == 1
                          ? Colors.grey.shade500
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: (context.locale == const Locale('en')) ? 0 : 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 13,
                        width: greyWidth,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            topLeft: Radius.circular(7),
                          ),
                          color: value.isDarkTheme == 1
                              ? Colors.grey.shade800
                              : Colors.grey.shade300,
                        ),
                      ),
                      Container(
                        height: 13,
                        width: greenWidth,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(7),
                            topRight: Radius.circular(7),
                          ),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Image.asset('assets/images/doneImage.png'),
            ],
          ),
        );
      }),
    );
  }
}
