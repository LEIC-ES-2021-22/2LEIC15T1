import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/CourseUnit.dart';
import '../model/User.dart';
import '../model/Session.dart';
import 'package:http/http.dart' as http;

const loginUrl =
    'https://sigarra.up.pt/feup/pt/mob_val_geral.autentica';

Future<bool> login(String username, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var response = await http.post(Uri.parse(loginUrl), body: {'pv_login': username, 'pv_password': password});
  if (response.statusCode == 200) {
    await sharedPreferences.setString('token', "Token ${jsonDecode(response.body)['token']}");
    return true;
  }
  else {
    return false;
    //throw Exception('Failed to access $loginUrl');
  }

}




/// Returns the user's current list of [CourseUnit].
Future<List<CourseUnit>> getCurrentCourseUnits(Session session) async {
  var url = 'https://sigarra.up.pt/feup/pt/mob_fest_geral.ucurr_inscricoes_corrente?';
  var data = await session.get(url);
  print (data);
  return <CourseUnit>[];
}