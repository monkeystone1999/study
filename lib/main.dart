
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:production/src/bloc/isLogin.dart';
import 'package:production/src/bloc/tokenBloc.dart';
import 'package:production/src/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //secureStorage 에는 자동 로그인 여부와 token 2개를 저장하고 자동로그인 여부에 따라서 찾는다

    return MultiBlocProvider(
        providers: [
          BlocProvider<isLoginBloc>(create: (BuildContext context) => isLoginBloc()),
          BlocProvider<tokenBloc>(create: (BuildContext context) => tokenBloc()),
        ], child: config());
  }
}

//App bar with floating: false, pinned: true, snap: false:
