import 'package:flutter/material.dart';


class myPage extends StatelessWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
