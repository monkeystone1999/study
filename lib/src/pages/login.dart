import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController Id = TextEditingController();
  TextEditingController PassWord = TextEditingController();
  static final storage = FlutterSecureStorage();

  //로그인 보내는 부분
  Future<List> _future(context) async{
    final URL = "http://anu330.iptime.org:8080/withcar/login-process";
    var params = {
      "userId": '${Id.text}',
      "pw": '${PassWord.text}'
    };
    var response;
    await http.post(Uri.parse(URL), body: params).then((value) => response = value);
    var json_res = jsonDecode(response.body);

    if(response.body.isNotEmpty){
      Navigator.popUntil(context, (context)=> context.isFirst);
      await storage.write(key: "access_token", value: json_res['access_token']);
      await storage.write(key: "refresh_token", value: json_res['refresh_token']);
      var values = await storage.read(key : "access_token");
      print(values);
    }
    return [];
  }
  //로그인 여부에 따라서 저장할지 안할지 선택하자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ID",
                ),
                controller: Id,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 100,),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PASSWORD",
                ),
                controller: PassWord,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 85,
                  child: ElevatedButton(
                    onPressed: () {
                      _future(context);
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(width: 50,),
                SizedBox(
                  width: 85,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Sign Up'),
                  ),
                )
              ],
            ),
          ],
        ))
      ),
    );
  }
}
