import 'package:bloc/bloc.dart';
import 'package:production/src/bloc/blocEvent/recruit_Event.dart';
import 'package:production/src/bloc/blocState/recruit_State.dart';

class Recruit extends Bloc<baseRecruitEvent, RecruitState> {
  Recruit() : super(RecruitState()) {
    on<baseRecruitEvent>((event, emit) async {
      emit(RecruitState());
    });
  }
}
