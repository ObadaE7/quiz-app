import 'package:flutter/material.dart';

class CirclePlaceholder extends StatelessWidget {
  final double radius;
  const CirclePlaceholder({
    super.key,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white.withOpacity(.1),
    );
  }
}
