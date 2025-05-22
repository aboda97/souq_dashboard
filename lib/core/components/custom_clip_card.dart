import 'package:flutter/material.dart';

class CustomClipCard extends CustomClipper<Path> {
  final bool isLeft;

  CustomClipCard({required this.isLeft});

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (isLeft) {
      path.lineTo(20, 0);
      path.quadraticBezierTo(0, size.height / 2, 20, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.lineTo(size.width - 20, 0);
      path.quadraticBezierTo(
        size.width,
        size.height / 2,
        size.width - 20,
        size.height,
      );
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
