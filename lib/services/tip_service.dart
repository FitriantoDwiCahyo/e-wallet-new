import 'dart:convert';

import 'package:e_wallet_new/services/auth_service.dart';
import 'package:e_wallet_new/shared/shared_values.dart';
import 'package:http/http.dart' as http;

import '../models/tip_model.dart';

class TipService {
  Future<List<TipModel>> getTips() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<TipModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipModel.fromJson(tip),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
