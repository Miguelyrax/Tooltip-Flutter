import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {

  MyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..color=Colors.white
    ..style=PaintingStyle.fill
    ..strokeWidth=2;

    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width/2, size.height);
    path.close();
    canvas.drawPath(path, paint);

    
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;

}
