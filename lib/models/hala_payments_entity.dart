import 'package:multichoice/generated/json/base/json_convert_content.dart';

class HalaPaymentsEntity with JsonConvert<HalaPaymentsEntity> {
	String? trxRef;
	int? fromEntityId;
	int? toEntityId;
	int? amount;
	String? trxDate;
	String? mobileNumber;
	String? fullNameAR;
	String? fullNameEN;
	String? corporateFullNameAR;
	String? corporateFullNameEN;
}
