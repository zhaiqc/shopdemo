import 'package:shop/root/home/category_entity.dart';

categoryEntityFromJson(CategoryEntity data, Map<String, dynamic> json) {
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
		data.data = new List<CategoryData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CategoryData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> categoryEntityToJson(CategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['time'] = entity.time;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

categoryDataFromJson(CategoryData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['pid'] != null) {
		data.pid = json['pid']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['flag'] != null) {
		data.flag = json['flag']?.toString();
	}
	if (json['type_text'] != null) {
		data.typeText = json['type_text']?.toString();
	}
	if (json['flag_text'] != null) {
		data.flagText = json['flag_text']?.toString();
	}
	return data;
}

Map<String, dynamic> categoryDataToJson(CategoryData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['pid'] = entity.pid;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['image'] = entity.image;
	data['flag'] = entity.flag;
	data['type_text'] = entity.typeText;
	data['flag_text'] = entity.flagText;
	return data;
}