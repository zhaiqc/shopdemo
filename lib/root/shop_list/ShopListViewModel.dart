import 'package:dio/dio.dart';
import 'package:shop/root/home/shopx_entity.dart';
import 'package:shop/utils/HttpUtils.dart';

class ShopListViewModel{
 Future<Stream<ShopxEntity>>  getShops({int page, int limit,int category_id})async{
    var data ={"category_id":category_id,"page":page,"limit":limit,"status":2};
    Response  res=await  HttpUtils().sendData(url: "index/index",data: data);
    print("getShops ${res}");
    ShopxEntity entity = ShopxEntity().fromJson(res.data);
    return Stream.value(entity);

  }
}