import 'dart:convert';
import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/configutrations.dart';
import 'package:http/http.dart' as http;

class Group {
  Future<List<dynamic>> getGroups() async {
    var url = Uri.http(startUrl, '/api/education/group/me/list/');
    List<String?> token = await Auth.getRA();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token[0]}',
    };

    var response = await http.get(url, headers: headers);

    final groups = jsonDecode(response.body);

    if (groups is Map) {
      bool success = await Auth().refreshToken();
      if (success) {
        return await getGroups();
      } else {
        print('object');
      }
    }

    return groups;
  }
}