import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:production/src/bloc/LoginBloc.dart';
import 'package:http/http.dart' as http;
import 'package:production/src/model/LoginModel.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginModel login = new LoginModel();
  TextEditingController Id = TextEditingController();
  TextEditingController PassWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: Form(
              child: Column(
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
          SizedBox(
            height: 100,
          ),
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
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: () async {
                    login.id = Id.text.toString();
                    login.pw = PassWord.text.toString();
                    context
                        .read<LoginBloc>()
                        .add(LoginSubmitEvent(login: login));
                    // Navigator.of(context).pushNamed('/');
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text('Sign Up'),
                ),
              )
            ],
          ),
        ],
      ))),
    );
  }
}
