import 'dart:convert';
import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/configutrations.dart';
import 'package:http/http.dart' as http;

class Mavzular {
  getGroupsLessons(int groupId) async {
    var url = Uri.http(startUrl, '/api/education/lessons/', {'group': groupId.toString()});
    List<String?> token = await Auth.getRA();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token[0]}',
    };

    var response = await http.get(url, headers: headers);
    final lessons = jsonDecode(response.body);

    if (lessons is Map) {
      bool success = await Auth().refreshToken();
      if (success) {
        return getGroupsLessons(groupId);
      } else {
        print('Smothing Went Wrong');
      }
    }

    return lessons;
  }
}