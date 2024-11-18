import 'package:flutter/material.dart';

class CirclePlaceholder extends StatelessWidget {
  final double radius;
  final double? opacity;

  const CirclePlaceholder({
    super.key,
    required this.radius,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white.withOpacity(opacity!),
    );
  }
}