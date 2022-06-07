
import 'dart:convert';

import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/CourseUnit.dart';
import '../model/Profile.dart';
import '../model/Session.dart';
import 'package:http/http.dart' as http;
import 'package:query_params/query_params.dart';

extension UriString on String{
  /// Converts a [String] to an [Uri].
  Uri toUri() => Uri.parse(this);
}

const loginUrl =
    'https://sigarra.up.pt/feup/pt/mob_val_geral.autentica';

Map<String,String> headers1 = {};

Future<bool> login(String username, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var response = await http.post(Uri.parse(loginUrl), body: {'pv_login': username, 'pv_password': password},headers:headers1);
  if (response.statusCode == 200) {
    updateCookie(response);
    await sharedPreferences.setString('token', "Token ${jsonDecode(response.body)['token']}");
    print(jsonDecode(response.body));
    await sharedPreferences.setString('codigo', jsonDecode(response.body)['codigo']);
    return true;
  }
  else {
    return false;
    //throw Exception('Failed to access $loginUrl');
  }

}


Future<Profile?> getProfile() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var studentNumber = sharedPreferences.getString('codigo');
  var url = 'https://sigarra.up.pt/feup/pt/mob_fest_geral.perfil?';

  //print(headers1['cookie']);

  final response = await getWithCookies(url, {'pv_codigo' : studentNumber!});
  if (response.statusCode == 200){
    //print('get profile success');
    sharedPreferences.setString('nome', jsonDecode(response.body)['nome']);
    return Profile.fromResponse(response);
  }
  else{
    print('cant get profile');
  }
}

void updateCookie(http.Response response){
  String? rawCookie = response.headers['set-cookie'];
  print ('raw cookie = $rawCookie');
  if (rawCookie != null) {
    var sanitizedCookie = rawCookie.replaceAll(",", ";"); // needed with sigarra
    headers1['cookie'] = sanitizedCookie;
  }
}

/// Makes an authenticated GET request with the given [session] to the
/// resource located at [url] with the given [query] parameters.
Future<http.Response> getWithCookies(
String baseUrl, Map<String, String> query) async {

  final URLQueryParams params = URLQueryParams();
  query.forEach((key, value) {
    params.append(key, value);
  });

  final url = baseUrl + params.toString();

  //final Map<String, String> headers = Map<String, String>();
  //print('headers1 cookie: ${headers1['cookie']}');

  final http.Response response = await http.get(url.toUri(), headers: headers1);
  if (response.statusCode == 200) {
    //print(response.body);
    return response;
  }
   else{
      return Future.error('HTTP Error ${response.statusCode}');
    }
}



/// Returns the user's current list of [CourseUnit].
Future getCurrentCourseUnits() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var studentNumber = sharedPreferences.getString('codigo');

  var url = 'https://sigarra.up.pt/feup/pt/mob_fest_geral.ucurr_inscricoes_corrente?';

  var response = await getWithCookies(url, {'pv_codigo': studentNumber!});

  if (response.statusCode == 200){
    print("RESPOSTA DE COURSE UNITS\n");
    //print(response.body);
    final responseBody = json.decode(response.body);
    return responseBody;
    /*
    final List<CourseUnit> ucs = <CourseUnit>[];
    for (var course in responseBody){
      for (var uc in course['inscricoes']){
        ucs.add(CourseUnit.fromJson(uc));
      }
    }

    return ucs;
    */

  }

  return <CourseUnit>[];
}

