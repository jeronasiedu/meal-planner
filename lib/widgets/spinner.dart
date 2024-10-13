import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2,
        backgroundColor: color,
      ),
    );
  }
}
