import 'package:shop/root/home/shop_entity.dart';

shopEntityFromJson(ShopEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<ShopData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ShopData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> shopEntityToJson(ShopEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['time'] = entity.time;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

shopDataFromJson(ShopData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['category_id'] != null) {
		data.categoryId = json['category_id']?.toInt();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	if (json['original_price'] != null) {
		data.originalPrice = json['original_price']?.toString();
	}
	if (json['price_title'] != null) {
		data.priceTitle = json['price_title']?.toString();
	}
	if (json['smallimages'] != null) {
		data.smallimages = json['smallimages']?.toString();
	}
	if (json['shoplike'] != null) {
		data.shoplike = json['shoplike']?.toInt();
	}
	if (json['recommend'] != null) {
		data.recommend = json['recommend']?.toInt();
	}
	if (json['status_text'] != null) {
		data.statusText = json['status_text']?.toString();
	}
	if (json['spell_status_text'] != null) {
		data.spellStatusText = json['spell_status_text']?.toString();
	}
	return data;
}

Map<String, dynamic> shopDataToJson(ShopData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['category_id'] = entity.categoryId;
	data['price'] = entity.price;
	data['original_price'] = entity.originalPrice;
	data['price_title'] = entity.priceTitle;
	data['smallimages'] = entity.smallimages;
	data['shoplike'] = entity.shoplike;
	data['recommend'] = entity.recommend;
	data['status_text'] = entity.statusText;
	data['spell_status_text'] = entity.spellStatusText;
	return data;
}