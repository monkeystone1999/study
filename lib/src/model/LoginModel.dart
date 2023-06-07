class LoginModel {
  String _id = "";
  String _pw = "";
  set id(String id) {
    _id = id;
  }

  set pw(String pw) {
    _pw = pw;
  }

  String get id {
    return _id;
  }

  String get pw {
    return _pw;
  }
}
