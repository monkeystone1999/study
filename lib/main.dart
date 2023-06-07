import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:production/src/App.dart';
import 'package:production/src/bloc/LoginBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //secureStorage 에는 자동 로그인 여부와 token 2개를 저장하고 자동로그인 여부에 따라서 찾는다
    //로그인을 확인하즈아!
    return (MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
    ], child: App()));
  }
}

//App bar with floating: false, pinned: true, snap: false:
