import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneSmallIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color c;
  OneSmallIcon(this.iconData, this.text, this.c, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
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
  }
}
