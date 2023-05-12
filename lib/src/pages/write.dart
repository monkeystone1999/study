import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:production/src/pages/presentation/input_1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});


  TextEditingController? boardTitle = TextEditingController(),
      fee = TextEditingController(),
      personLimit = TextEditingController(),
      startPoint = TextEditingController(),
      endPoint = TextEditingController(),
      startTime = TextEditingController(),
      comment = TextEditingController();

  Future _future(context) async {
    final URL = "http://anu330.iptime.org:8080/withcar/recruit/new";
    var params = {
      'boardTitle': '${boardTitle?.text}',
      'fee': '${fee?.text}',
      'personLimit': '${personLimit?.text}',
      'startPoint': '${startPoint?.text}',
      'endPoint': '${endPoint?.text}',
      'startTime': '${startTime?.text}',
      'comment': '${comment?.text}'
    };
    await http.post(Uri.parse(URL), body: params).then((value) => {
          if (value.body.isDefinedAndNotNull)
            {Navigator.popUntil(context, (route) => route.isFirst)}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Input_1(target: boardTitle, width: 200),
        Input_1(target: fee, width: 200),
        Input_1(target: personLimit, width: 200),
        Input_1(target: startPoint, width: 200),
        Input_1(target: endPoint, width: 200),
        Input_1(target: startTime, width: 200),
        Input_1(target: comment, width: 200),
        TextButton(onPressed: (){
          _future(context);
        }, child: Text('제출'))
      ]),
    );
  }
}
