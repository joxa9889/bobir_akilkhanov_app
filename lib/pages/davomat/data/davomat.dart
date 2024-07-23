import 'dart:convert';

import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/configutrations.dart';
import 'package:http/http.dart' as http;

class Davomat {
  Future<List<dynamic>> getAttendance(groupId) async {
    var url = Uri.http(startUrl, '/api/education/my_attendance/${groupId}',);
    List<String?> token = await Auth.getRA();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token[0]}',
    };

    var response = await http.get(url, headers: headers);
    
    final attendances = jsonDecode(response.body);

    if (attendances is Map) {
      bool success = await Auth().refreshToken();
      if (success) {
        return await getAttendance(groupId);
      } else {
        print('object');
      }
    }

    return attendances;
  }
}