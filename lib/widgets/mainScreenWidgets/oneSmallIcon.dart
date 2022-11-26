import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_second_project/providers/mainScreenProvider.dart';
import 'package:provider/provider.dart';

class OneSmallIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color c;
  OneSmallIcon(this.iconData, this.text, this.c, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: ((context, value, child) {
        return Container(
          height: 24,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
            color: value.isDarkTheme == 1 ? Colors.black : Colors.blue.shade300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  iconData,
                  size: 15,
                  color: c,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 11,
                  color: c,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
