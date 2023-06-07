import 'package:equatable/equatable.dart';
import 'package:production/src/model/AuthModel.dart';
import 'package:production/src/model/LoginModel.dart';

class LoginState extends Equatable {
  final AuthModel _auth = new AuthModel();
  final String? _access_token;
  final String? _refresh_token;
  LoginState({String? access_token, String? refresh_token})
      : _access_token = access_token,
        _refresh_token = refresh_token;

  set Token(Map<String, dynamic> token) {
    _auth.Access = token['access_token'];
    _auth.Refresh = token['refresh_token'];
  }

  LoginState copyWith({String? access_token, String? refresh_token}) {
    return LoginState(
        access_token: access_token ?? this._access_token,
        refresh_token: refresh_token ?? this._refresh_token);
  }

  void Do() {
    _auth.Access = _access_token!;
    _auth.Refresh = _refresh_token!;
  }

  @override
  List<Object?> get props => [];
}
