import 'package:shop/root/home/model/banner_bean_entity.dart';

bannerBeanEntityFromJson(BannerBeanEntity data, Map<String, dynamic> json) {
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
		data.data = new List<BannerBeanData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new BannerBeanData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> bannerBeanEntityToJson(BannerBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['time'] = entity.time;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

bannerBeanDataFromJson(BannerBeanData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['jump_address'] != null) {
		data.jumpAddress = json['jump_address']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['createtime'] != null) {
		data.createtime = json['createtime']?.toInt();
	}
	if (json['updatetime'] != null) {
		data.updatetime = json['updatetime']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['status_text'] != null) {
		data.statusText = json['status_text']?.toString();
	}
	return data;
}

Map<String, dynamic> bannerBeanDataToJson(BannerBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['jump_address'] = entity.jumpAddress;
	data['image'] = entity.image;
	data['createtime'] = entity.createtime;
	data['updatetime'] = entity.updatetime;
	data['status'] = entity.status;
	data['status_text'] = entity.statusText;
	return data;
}