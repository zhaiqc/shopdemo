// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:shop/root/login/model/login_entity.dart';
import 'package:shop/generated/json/login_entity_helper.dart';
import 'package:shop/root/home/model/shop_detail_entity.dart';
import 'package:shop/generated/json/shop_detail_entity_helper.dart';
import 'package:shop/root/home/model/category_bean_entity.dart';
import 'package:shop/generated/json/category_bean_entity_helper.dart';
import 'package:shop/root/login/model/code_entity.dart';
import 'package:shop/generated/json/code_entity_helper.dart';
import 'package:shop/root/home/model/banner_bean_entity.dart';
import 'package:shop/generated/json/banner_bean_entity_helper.dart';
import 'package:shop/root/home/shopx_entity.dart';
import 'package:shop/generated/json/shopx_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case LoginEntity:
			return loginEntityFromJson(data as LoginEntity, json) as T;			case LoginData:
			return loginDataFromJson(data as LoginData, json) as T;			case LoginDataUserinfo:
			return loginDataUserinfoFromJson(data as LoginDataUserinfo, json) as T;			case ShopDetailEntity:
			return shopDetailEntityFromJson(data as ShopDetailEntity, json) as T;			case ShopDetailData:
			return shopDetailDataFromJson(data as ShopDetailData, json) as T;			case ShopDetailDataSetmeal:
			return shopDetailDataSetmealFromJson(data as ShopDetailDataSetmeal, json) as T;			case ShopDetailDataSetmealConfigjson:
			return shopDetailDataSetmealConfigjsonFromJson(data as ShopDetailDataSetmealConfigjson, json) as T;			case ShopDetailDataManystoretap:
			return shopDetailDataManystoretapFromJson(data as ShopDetailDataManystoretap, json) as T;			case ShopDetailDataManystore:
			return shopDetailDataManystoreFromJson(data as ShopDetailDataManystore, json) as T;			case CategoryBeanEntity:
			return categoryBeanEntityFromJson(data as CategoryBeanEntity, json) as T;			case CategoryBeanData:
			return categoryBeanDataFromJson(data as CategoryBeanData, json) as T;			case CodeEntity:
			return codeEntityFromJson(data as CodeEntity, json) as T;			case BannerBeanEntity:
			return bannerBeanEntityFromJson(data as BannerBeanEntity, json) as T;			case BannerBeanData:
			return bannerBeanDataFromJson(data as BannerBeanData, json) as T;			case ShopxEntity:
			return shopxEntityFromJson(data as ShopxEntity, json) as T;			case ShopxData:
			return shopxDataFromJson(data as ShopxData, json) as T;			case ShopxDataManystoretapsText:
			return shopxDataManystoretapsTextFromJson(data as ShopxDataManystoretapsText, json) as T;	    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case LoginEntity:
			return loginEntityToJson(data as LoginEntity);			case LoginData:
			return loginDataToJson(data as LoginData);			case LoginDataUserinfo:
			return loginDataUserinfoToJson(data as LoginDataUserinfo);			case ShopDetailEntity:
			return shopDetailEntityToJson(data as ShopDetailEntity);			case ShopDetailData:
			return shopDetailDataToJson(data as ShopDetailData);			case ShopDetailDataSetmeal:
			return shopDetailDataSetmealToJson(data as ShopDetailDataSetmeal);			case ShopDetailDataSetmealConfigjson:
			return shopDetailDataSetmealConfigjsonToJson(data as ShopDetailDataSetmealConfigjson);			case ShopDetailDataManystoretap:
			return shopDetailDataManystoretapToJson(data as ShopDetailDataManystoretap);			case ShopDetailDataManystore:
			return shopDetailDataManystoreToJson(data as ShopDetailDataManystore);			case CategoryBeanEntity:
			return categoryBeanEntityToJson(data as CategoryBeanEntity);			case CategoryBeanData:
			return categoryBeanDataToJson(data as CategoryBeanData);			case CodeEntity:
			return codeEntityToJson(data as CodeEntity);			case BannerBeanEntity:
			return bannerBeanEntityToJson(data as BannerBeanEntity);			case BannerBeanData:
			return bannerBeanDataToJson(data as BannerBeanData);			case ShopxEntity:
			return shopxEntityToJson(data as ShopxEntity);			case ShopxData:
			return shopxDataToJson(data as ShopxData);			case ShopxDataManystoretapsText:
			return shopxDataManystoretapsTextToJson(data as ShopxDataManystoretapsText);	   }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'LoginEntity':
			return LoginEntity().fromJson(json);			case 'LoginData':
			return LoginData().fromJson(json);			case 'LoginDataUserinfo':
			return LoginDataUserinfo().fromJson(json);			case 'ShopDetailEntity':
			return ShopDetailEntity().fromJson(json);			case 'ShopDetailData':
			return ShopDetailData().fromJson(json);			case 'ShopDetailDataSetmeal':
			return ShopDetailDataSetmeal().fromJson(json);			case 'ShopDetailDataSetmealConfigjson':
			return ShopDetailDataSetmealConfigjson().fromJson(json);			case 'ShopDetailDataManystoretap':
			return ShopDetailDataManystoretap().fromJson(json);			case 'ShopDetailDataManystore':
			return ShopDetailDataManystore().fromJson(json);			case 'CategoryBeanEntity':
			return CategoryBeanEntity().fromJson(json);			case 'CategoryBeanData':
			return CategoryBeanData().fromJson(json);			case 'CodeEntity':
			return CodeEntity().fromJson(json);			case 'BannerBeanEntity':
			return BannerBeanEntity().fromJson(json);			case 'BannerBeanData':
			return BannerBeanData().fromJson(json);			case 'ShopxEntity':
			return ShopxEntity().fromJson(json);			case 'ShopxData':
			return ShopxData().fromJson(json);			case 'ShopxDataManystoretapsText':
			return ShopxDataManystoretapsText().fromJson(json);	   }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'LoginEntity':
			return List<LoginEntity>();			case 'LoginData':
			return List<LoginData>();			case 'LoginDataUserinfo':
			return List<LoginDataUserinfo>();			case 'ShopDetailEntity':
			return List<ShopDetailEntity>();			case 'ShopDetailData':
			return List<ShopDetailData>();			case 'ShopDetailDataSetmeal':
			return List<ShopDetailDataSetmeal>();			case 'ShopDetailDataSetmealConfigjson':
			return List<ShopDetailDataSetmealConfigjson>();			case 'ShopDetailDataManystoretap':
			return List<ShopDetailDataManystoretap>();			case 'ShopDetailDataManystore':
			return List<ShopDetailDataManystore>();			case 'CategoryBeanEntity':
			return List<CategoryBeanEntity>();			case 'CategoryBeanData':
			return List<CategoryBeanData>();			case 'CodeEntity':
			return List<CodeEntity>();			case 'BannerBeanEntity':
			return List<BannerBeanEntity>();			case 'BannerBeanData':
			return List<BannerBeanData>();			case 'ShopxEntity':
			return List<ShopxEntity>();			case 'ShopxData':
			return List<ShopxData>();			case 'ShopxDataManystoretapsText':
			return List<ShopxDataManystoretapsText>();		  }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}