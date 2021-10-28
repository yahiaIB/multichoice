import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multichoice/models/hala_payments_entity.dart';
import 'package:multichoice/utils/helper_functions.dart';
import 'package:multichoice/web_service/end_points.dart';
import 'package:multichoice/web_service/http_client.dart';

class HalaPaymentsRepository {
  late final HttpClient _httpClientService;

  HalaPaymentsRepository() {
    _httpClientService = HttpClient();
  }

  Future<Map<String, dynamic>> getHalaPayments() async {
    try {
      final response =
          await _httpClientService.getInstance().get(EndPoints.halaPayments);
      HelperFunctions.isValidResponse(response);
      return {
        "list": response.data["result"]["dateSet"]
            .map<HalaPaymentsEntity>((e) => HalaPaymentsEntity().fromJson(e))
            .toList(),
        "totalAmount": response.data["totalAmount"]
      };
    } catch (e) {
      rethrow;
    }
  }
}
