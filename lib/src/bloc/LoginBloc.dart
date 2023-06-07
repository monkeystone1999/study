import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:production/src/bloc/state/LoginState.dart';
import 'package:production/src/model/LoginModel.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSubmitEvent>((event, emit) async {
      Map<String, dynamic> res = await event.future();
      state.Token = res;
      final newState = state.copyWith(
        access_token: res['access'],
        refresh_token: res['refresh'],
      );
      newState.Do();
      print(newState);
      emit(newState);
    });
  }
}

abstract class LoginEvent extends Equatable {}

class LoginSubmitEvent extends LoginEvent {
  final LoginModel? login;

  LoginSubmitEvent({this.login});

  Future<Map<String, dynamic>> future() async {
    final queryParameters = {
      'userId': login?.id,
      'pw': login?.pw,
    };
    final uri = Uri.http(
        'anu330.iptime.org:8080', '/withcar/login-process', queryParameters);
    final response = await http.post(uri);
    final res = jsonDecode(response.body);
    return res["token"];
  }

  @override
  List<Object> get props => [
        {"id": login?.id, "pw": login?.pw}
      ];
}
