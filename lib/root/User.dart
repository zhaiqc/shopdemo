import 'login/model/login_entity.dart';

class User{
  static final User _instance = new User._internal();

  factory User() {
    return _instance;
  }

  User._internal();
  LoginEntity _entity;



  LoginEntity get entity => _entity;

  set entity(LoginEntity value) {
    _entity = value;
  }


}