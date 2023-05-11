

import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class isLoginState extends Equatable{
  bool isLogin = false;
  final storage = new FlutterSecureStorage();

  isLoginState({required this.isLogin});

  isLoginState.set({required this.isLogin}){
    storage.write(key: 'isLogin', value: isLogin.toString());
  }
  isLoginState.get(){
    isLogin;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLogin];
}