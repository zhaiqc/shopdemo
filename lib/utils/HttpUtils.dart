import 'package:dio/dio.dart';
import 'package:shop/utils/AppConfig.dart';

class HttpUtils{
  static final HttpUtils _instance = new HttpUtils._internal();
  factory HttpUtils() {
    return _instance;
  }
  HttpUtils._internal();
  Dio dio = new Dio();

  Future<Response> sendData({String url,data})async{
    Response response = await dio.post(AppConfig.host+url,data: data);
      return response;
  }


  Future<Response> init ({String url})async{
    Response response =await   sendData(url: url);
    return response;
  }


}