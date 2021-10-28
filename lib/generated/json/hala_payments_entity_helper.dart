import 'package:multichoice/models/hala_payments_entity.dart';

halaPaymentsEntityFromJson(HalaPaymentsEntity data, Map<String, dynamic> json) {
	if (json['trxRef'] != null) {
		data.trxRef = json['trxRef'].toString();
	}
	if (json['fromEntityId'] != null) {
		data.fromEntityId = json['fromEntityId'] is String
				? int.tryParse(json['fromEntityId'])
				: json['fromEntityId'].toInt();
	}
	if (json['toEntityId'] != null) {
		data.toEntityId = json['toEntityId'] is String
				? int.tryParse(json['toEntityId'])
				: json['toEntityId'].toInt();
	}
	if (json['amount'] != null) {
		data.amount = json['amount'] is String
				? int.tryParse(json['amount'])
				: json['amount'].toInt();
	}
	if (json['trxDate'] != null) {
		data.trxDate = json['trxDate'].toString();
	}
	if (json['mobileNumber'] != null) {
		data.mobileNumber = json['mobileNumber'].toString();
	}
	if (json['fullNameAR'] != null) {
		data.fullNameAR = json['fullNameAR'].toString();
	}
	if (json['fullNameEN'] != null) {
		data.fullNameEN = json['fullNameEN'].toString();
	}
	if (json['corporateFullNameAR'] != null) {
		data.corporateFullNameAR = json['corporateFullNameAR'].toString();
	}
	if (json['corporateFullNameEN'] != null) {
		data.corporateFullNameEN = json['corporateFullNameEN'].toString();
	}
	return data;
}

Map<String, dynamic> halaPaymentsEntityToJson(HalaPaymentsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['trxRef'] = entity.trxRef;
	data['fromEntityId'] = entity.fromEntityId;
	data['toEntityId'] = entity.toEntityId;
	data['amount'] = entity.amount;
	data['trxDate'] = entity.trxDate;
	data['mobileNumber'] = entity.mobileNumber;
	data['fullNameAR'] = entity.fullNameAR;
	data['fullNameEN'] = entity.fullNameEN;
	data['corporateFullNameAR'] = entity.corporateFullNameAR;
	data['corporateFullNameEN'] = entity.corporateFullNameEN;
	return data;
}