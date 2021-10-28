import 'package:multichoice/models/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['fullName'] != null) {
		data.fullName = json['fullName'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['userName'] != null) {
		data.userName = json['userName'].toString();
	}
	if (json['dateCreated'] != null) {
		data.dateCreated = json['dateCreated'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['roles'] != null) {
		data.roles = (json['roles'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['fullName'] = entity.fullName;
	data['email'] = entity.email;
	data['userName'] = entity.userName;
	data['dateCreated'] = entity.dateCreated;
	data['token'] = entity.token;
	data['roles'] = entity.roles;
	return data;
}