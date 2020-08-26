import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/root/User.dart';
import 'package:shop/root/login/model/code_entity.dart';
import 'package:shop/root/login/model/login_entity.dart';
import 'package:shop/root/login/view/LoginView.dart';
import 'package:shop/utils/HttpUtils.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

class LoginViewModel{
  LoginView _view;

  LoginViewModel(this._view);
  void sendCode({String phoneNum})async{
    FormData formData = new FormData.fromMap({"mobile": phoneNum,"event":"mobilelogin"});

    Response  res=await  HttpUtils().sendData(url: "sms/send",data: formData);
    CodeEntity entity =new CodeEntity().fromJson(res.data);
    if(entity.code==1){
      _view.sendCodeSuccess(entity.msg);
    }
  }

  void login({String phoneNum,String code})async{
    FormData formData = new FormData.fromMap({"mobile": phoneNum,"captcha":code});
    print('login ${formData}');

    Response  res=await  HttpUtils().sendData(url: "user/mobilelogin",data: formData);
    print('login ${res.data}');
    LoginEntity entity =new LoginEntity().fromJson(res.data);
    if(entity.code==1){
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.setString("user",jsonEncode(res.data));

//      SharedPreferencesPlugin().setValue("login", "user", res.data);
      new User().entity=entity;
      _view.loginSuccess(entity.msg);
    }else{
      _view.error(entity.msg);
    }
  }
  void reg(){

  }

}