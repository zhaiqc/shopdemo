import 'package:shop/root/login/model/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
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
		data.data = new LoginData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['time'] = entity.time;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

loginDataFromJson(LoginData data, Map<String, dynamic> json) {
	if (json['userinfo'] != null) {
		data.userinfo = new LoginDataUserinfo().fromJson(json['userinfo']);
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.userinfo != null) {
		data['userinfo'] = entity.userinfo.toJson();
	}
	return data;
}

loginDataUserinfoFromJson(LoginDataUserinfo data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['username'] != null) {
		data.username = json['username']?.toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['score'] != null) {
		data.score = json['score']?.toInt();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['user_id'] != null) {
		data.userId = json['user_id']?.toInt();
	}
	if (json['createtime'] != null) {
		data.createtime = json['createtime']?.toInt();
	}
	if (json['expiretime'] != null) {
		data.expiretime = json['expiretime']?.toInt();
	}
	if (json['expires_in'] != null) {
		data.expiresIn = json['expires_in']?.toInt();
	}
	return data;
}

Map<String, dynamic> loginDataUserinfoToJson(LoginDataUserinfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['nickname'] = entity.nickname;
	data['mobile'] = entity.mobile;
	data['avatar'] = entity.avatar;
	data['score'] = entity.score;
	data['token'] = entity.token;
	data['user_id'] = entity.userId;
	data['createtime'] = entity.createtime;
	data['expiretime'] = entity.expiretime;
	data['expires_in'] = entity.expiresIn;
	return data;
}