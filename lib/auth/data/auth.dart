import 'dart:convert';
import 'package:bobir_akilkhanov/configutrations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Future<List<String?>> getRA() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return [prefs.getString('access'), prefs.getString('refresh')];
  }

  makeAuth(username, password) async {
    var url = Uri.http(startUrl, '/api/token/');

    var data = {
      "phone_number": username,
      "password": password,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    String body = json.encode(data);
    var response = await http.post(url, body: body, headers: headers);
    final token = jsonDecode(response.body);

    if (token.containsKey('refresh') && token.containsKey('access')) {
      if (token['role'].contains('student')) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access', token['access']);
        await prefs.setString('refresh', token['refresh']);
      }
    }

    return token;
  }

  Future<bool> refreshToken() async {
    var url = Uri.http(startUrl, '/api/token/refresh/');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    var data = {
      "refresh": prefs.getString('refresh'),
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    String body = json.encode(data);
    var response = await http.post(url, body: body, headers: headers);
    final token = jsonDecode(response.body);

    if (token.containsKey('refresh') && token.containsKey('access')) {
      await prefs.setString('access', token['access']);
      await prefs.setString('refresh', token['refresh']);
      return true;
    }

    return false;
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access');
    prefs.remove('refresh');
    return true;
  }
}