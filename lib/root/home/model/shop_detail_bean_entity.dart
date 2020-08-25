import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class ShopDetailBeanEntity with JsonConvert<ShopDetailBeanEntity> {
	int code;
	String msg;
	String time;
	ShopDetailBeanData data;
}

class ShopDetailBeanData with JsonConvert<ShopDetailBeanData> {
	int id;
	String title;
	String subtitle;
	@JSONField(name: "category_id")
	int categoryId;
	String price;
	@JSONField(name: "original_price")
	String originalPrice;
	@JSONField(name: "price_title")
	String priceTitle;
	String smallimages;
	int shoplike;
	int recommend;
	String status;
	@JSONField(name: "spell_status")
	String spellStatus;
	@JSONField(name: "spell_num")
	int spellNum;
	int createtime;
	int updatetime;
	@JSONField(name: "manystore_id")
	int manystoreId;
	@JSONField(name: "setmeal_ids")
	String setmealIds;
	@JSONField(name: "manystoretaps_ids")
	String manystoretapsIds;
	String attachfile;
	String content;
	String rightsandinterestscontent;
	String mianzecontent;
	List<ShopDetailBeanDataSetmeal> setmeal;
	List<ShopDetailBeanDataManystoretap> manystoretaps;
	ShopDetailBeanDataManystore manystore;
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "spell_status_text")
	String spellStatusText;
}

class ShopDetailBeanDataSetmeal with JsonConvert<ShopDetailBeanDataSetmeal> {
	int id;
	String name;
	String configjson;
	@JSONField(name: "status_text")
	String statusText;
}

class ShopDetailBeanDataManystoretap with JsonConvert<ShopDetailBeanDataManystoretap> {
	int id;
	String name;
}

class ShopDetailBeanDataManystore with JsonConvert<ShopDetailBeanDataManystore> {
	int id;
	String name;
	String logo;
	String image;
	String tel;
	String address;
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "create_time_text")
	String createTimeText;
	@JSONField(name: "update_time_text")
	String updateTimeText;
}
