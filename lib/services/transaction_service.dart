import 'dart:convert';

import 'package:e_wallet_new/models/topup_form_model.dart';
import 'package:e_wallet_new/shared/shared_values.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
