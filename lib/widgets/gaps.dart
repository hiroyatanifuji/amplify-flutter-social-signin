import 'package:flutter/material.dart';

class Gaps extends StatelessWidget {
  const Gaps({
    Key? key,
    this.size = 32,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
    );
  }
}
