import 'package:equatable/equatable.dart';

abstract class RecruitEvent extends Equatable {}

class baseRecruitEvent extends RecruitEvent {
  @override
  List<Object> get props => [];
}