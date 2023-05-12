import 'package:flutter/material.dart';

class Input_1 extends StatelessWidget {
  Input_1(
      {Key? key,
      required TextEditingController? this.target,
      required this.width})
      : super(key: key);
  final TextEditingController? target;
  final int width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: target.toString(),
        ),
        controller: target,
        textAlign: TextAlign.center,
      ),
    );
  }
}
