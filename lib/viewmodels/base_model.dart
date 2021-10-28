import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel with ChangeNotifier {
  //TODO if you need handle the base progress changes or errors provide setters getters for your values and notify your listener

  bool _busy = false;
  String _error = '';

  String get error => _error;

  set error(String value) {
    _error = value;
  }

  handleErrorMessage(e) {
    String error_message = "";
    if (e.runtimeType == DioError) {
      switch (e.type) {
        case DioErrorType.cancel:
          error_message = "Request Cancelled";
          break;
        case DioErrorType.connectTimeout:
          error_message = "Request Timeout";
          break;
        case DioErrorType.other:
          error_message = "No Internet Connection";
          break;
        case DioErrorType.receiveTimeout:
          error_message = "Send Timeout";
          break;
        case DioErrorType.response:
          switch (e.response.statusCode) {
            case 400:
              error_message = e.response.data['message'];
              break;
            case 401:
              error_message = "Unauthorised Request";
              break;
            case 403:
              error_message = "Unauthorised Request";
              break;
            case 404:
              error_message =  e.response.data != null  ? e.response.data['message'] : "Not Found";
              break;
            case 409:
              error_message = "Conflict";
              break;
            case 408:
              error_message = "Request Timeout";
              break;
            case 500:
              error_message = "Internal Server Error";
              break;
            case 503:
              error_message = "Service Unavailable";
              break;
            case 504:
              error_message = "Gateway Time-out";
              break;
            default:
              var responseCode = e.response.statusCode;
              error_message = "Received invalid status code: $responseCode";
          }
          break;
        case DioErrorType.sendTimeout:
          error_message = "Send Timeout";
          break;
      }
    } else {
      error_message = "Internal Server Error";
    }
    error = error_message;
    return error_message;
  }

  void setError({err}) {
    if (err != null) {
      _error = err;
    }
    setBusy(false);
  }

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setBusyWithOutNotify(bool value) {
    _busy = value;
  }

  bool disposed = false;

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}

