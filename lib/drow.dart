import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.grey.shade900
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = Colors.grey.shade900
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path1 = Path();
    path1.moveTo(size.width * 0.0833333, size.height * 0.1714286);
    path1.cubicTo(
        size.width * 0.1250000,
        size.height * 0.2142857,
        size.width * 0.1250000,
        size.height * 0.3571429,
        size.width * 0.0833333,
        size.height * 0.4000000);
    path1.cubicTo(
        size.width * 0.0250000,
        size.height * 0.4714286,
        size.width * 0.0250000,
        size.height * 0.4714286,
        0,
        size.height * 0.5714286);
    path1.cubicTo(0, size.height * 0.5000000, 0, size.height * 0.0714286, 0, 0);
    path1.cubicTo(
        size.width * 0.0250000,
        size.height * 0.1000000,
        size.width * 0.0250000,
        size.height * 0.1000000,
        size.width * 0.0833333,
        size.height * 0.1714286);
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
