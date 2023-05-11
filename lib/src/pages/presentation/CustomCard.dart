

import 'dart:ffi';

import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  CustomCard({Key? key, required this.child,  required Map<String, int> this.size ,required this.onTap})
      : super(key: key);
  final child;
  final onTap;
  final Map<String, int> size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: SizedBox(
          width: size['width']!.toDouble(),
          height: size['height']!.toDouble(),
          child: Center(
            child: InkWell(
              onTap: onTap,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}