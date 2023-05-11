
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:production/src/bloc/blocEvent/isLoginEvent.dart';
import 'package:production/src/bloc/blocState/isLoginState.dart';

// ignore: camel_case_types
class isLoginBloc extends Bloc<isLoginEvent, bool> {

  isLoginBloc() : super(false){
    on<onLoginEvent>((event, emit){
      emit(true);
    });
    on<offLoginEvent>((event, emit){
      emit(false);
    });
    // ignore: void_checks
    on<isLoginEvent>((event, emit){
      return state;
    });
  }
}
