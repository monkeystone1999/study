import 'package:flutter/material.dart';
import 'package:production/src/pages/presentation/input_1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  TextEditingController? ID = TextEditingController(),
      PW = TextEditingController(),
      PWCHECK = TextEditingController(),
      PHONENUMBER = TextEditingController(),
      EMAIL = TextEditingController(),
      GENDER = TextEditingController(),
      NICK = TextEditingController();

  Future<List> _future(context) async {
    final URL = "http://anu330.iptime.org:8080/withcar/signup";
    var params = {
      "id": '${ID?.text}',
      "pw": '${PW?.text}',
      "pw_check": '${PWCHECK?.text}',
      "nick": '${NICK?.text}',
      "gender": '${GENDER?.text}',
      "email": '${EMAIL?.text}',
      "phone_number": '${PHONENUMBER?.text}',
    };
    var response;
    await http
        .post(Uri.parse(URL), body: params)
        .then((value) => response = value);
    var json_res = jsonDecode(response.body);
    if (response.body.isDefinedAndNotNull) {
      Navigator.popUntil(context, (context) => context.isFirst);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Center(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Input_1(target: ID, width: 100),
            Input_1(target: PW, width: 100),
            Input_1(target: PWCHECK, width: 100),
            Input_1(target: PHONENUMBER, width: 100),
            Input_1(target: EMAIL, width: 100),
            Input_1(target: GENDER, width: 100),
            Input_1(target: NICK, width: 100),
            TextButton(
                onPressed: () {
                  _future(context);
                },
                child: Text('제출!'))
          ],
        )),
      ),
    );
  }
}
