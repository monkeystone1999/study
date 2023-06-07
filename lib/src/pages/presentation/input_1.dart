import 'package:flutter/material.dart';

class Input_1 extends StatelessWidget {
  Input_1(
      {Key? key,
      required TextEditingController? this.target,
      required this.width,
      required String this.label})
      : super(key: key);
  final TextEditingController? target;
  final int width;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        controller: target,
        textAlign: TextAlign.center,
      ),
    );
  }
}
