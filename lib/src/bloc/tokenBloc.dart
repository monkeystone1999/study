

import 'package:bloc/bloc.dart';
import 'package:production/src/bloc/blocEvent/tokenEvent.dart';

import 'blocState/tokenState.dart';

class tokenBloc extends Bloc<tokenEvent, TokenState>{
  tokenBloc() : super(TokenState(access_token: '', refresh_token: '')){
    on<getToken>((event, emit) async {
    });
    on<setToken>((event, emit) async {
      emit(TokenState.fromJson(emit as Map<String, dynamic>));
    //  Map<String, dynamic 으로 보내줘야한다
    });
  }
}