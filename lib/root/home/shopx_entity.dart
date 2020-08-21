import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class ShopxEntity with JsonConvert<ShopxEntity> {
	int code;
	String msg;
	String time;
	List<ShopxData> data;
}

class ShopxData with JsonConvert<ShopxData> {
	int id;
	String title;
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
	@JSONField(name: "manystoretaps_ids")
	String manystoretapsIds;
	@JSONField(name: "manystoretaps_text")
	List<ShopxDataManystoretapsText> manystoretapsText;
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "spell_status_text")
	String spellStatusText;
}

class ShopxDataManystoretapsText with JsonConvert<ShopxDataManystoretapsText> {
	int id;
	@JSONField(name: "manystore_id")
	int manystoreId;
	String name;
}
