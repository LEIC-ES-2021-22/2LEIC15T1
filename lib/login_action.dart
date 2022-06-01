import 'model/User.dart';
import 'model/Session.dart';

const loginUrl =
    'https://sigarra.up.pt/feup/pt/mob_val_geral.autentica';

Future<User?> login(Session session, String username, String password) async {
  var data = await session.post(loginUrl,
      {'pv_login': username, 'pv_password': password});
  if (data["authenticated"]) {
    print("authenticated");
    return User.fromJson(data);
  } else {
    return null;
  }
}