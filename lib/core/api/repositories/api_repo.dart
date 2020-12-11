import 'dart:core';

import 'package:flutter/material.dart';
import 'package:green_go/core/api/network/network_call.dart';

class BilimAPI {
  static BilimAPI _instance = BilimAPI.internal();
  BilimAPI.internal();
  factory BilimAPI() => _instance;

  NetworkCall _networkCall = NetworkCall();

  // auth API
  static const REGISTER_USER_WITH_DATA = '/auth/register';
  static const CHECK_EMAIL_CODE = '/auth/code';
  static const AUTH = '/auth/login';

  // flash card endpoints
  static const GET_FLASH_CARD = '/cards';

  Future<dynamic> verifySmsCodeFromEmail(String email, String code,
      [BuildContext context]) async {
    dynamic response = await _networkCall.doRequestAuth(
      path: CHECK_EMAIL_CODE,
      method: 'POST',
      context: context,
      body: {
        'email': email,
        'code': code,
      },
    );
    return response;
  }
}
