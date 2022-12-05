import 'dart:convert';

import 'package:e_wallet_new/models/user_edit_pin_form_model.dart';
import 'package:e_wallet_new/shared/shared_values.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';

class WalletService {
  Future<void> updatePin(UserEditPinFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/wallets'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
