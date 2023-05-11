

import 'package:equatable/equatable.dart';

abstract class tokenEvent extends Equatable{}

class getToken extends tokenEvent{
  @override
  List<Object?> get props => [];
}

class setToken extends tokenEvent{
  @override
  List<Object?> get props => [];
}