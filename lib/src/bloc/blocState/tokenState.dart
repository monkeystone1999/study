

//TextEditingController Id = TextEditingController();
//   TextEditingController PassWord = TextEditingController();


import 'package:equatable/equatable.dart';

class TokenState extends Equatable {
  final String access_token;
  final String refresh_token;

  const TokenState({
    required this.access_token,
    required this.refresh_token,
  });

  factory TokenState.fromJson(Map<String, dynamic> json) {
    return TokenState(
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [access_token, refresh_token];
}
