import 'package:flutter/material.dart';

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    // (0 , 0)  -> point 1
    path.lineTo(0, height); // point 2
    path.quadraticBezierTo(
      width * 0.5, // point 3
      height - 80, // point 3
      width, // point 4
      height, // point 4
    );
    path.lineTo(width, 0); // point 5
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
