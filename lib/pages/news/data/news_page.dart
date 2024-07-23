import 'dart:convert';

import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/configutrations.dart';
import 'package:http/http.dart' as http;

class News {
  getNews() async {
    var url = Uri.http(startUrl, '/api/news/');
    List<String?> token = await Auth.getRA();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token[0]}',
    };

    var response = await http.get(url, headers: headers);
    final news = jsonDecode(utf8.decode(response.bodyBytes));

    if (news is Map) {
      bool success = await Auth().refreshToken();
      if (success) {
        return getNews();
      } else {
        print('obj');
      }
    }

    return news;
  }
}