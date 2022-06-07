import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigarraio/UI/login.dart';
import 'package:sigarraio/UI/personalschedule.dart';
import 'package:sigarraio/UI/settings.dart';
import 'package:http/http.dart' as http;
import 'package:sigarraio/controller/login_action.dart';
import '../controller/logout_action.dart';
import '../model/Profile.dart';
import 'academicpathway.dart';
import 'homepage.dart';

class NavBar extends StatefulWidget {
  //String name;

  @override
  State<StatefulWidget> createState() => NavBarState();

}

class NavBarState extends State<NavBar> {
  String email = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    updateInfo();
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(name,style: TextStyle(color: Colors.black),),
            accountEmail: Text(email,style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://www.w3schools.com/howto/img_avatar.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.developer_board),
            title: const Text('Dashboard'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personal Schedule'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalSchedule()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_sharp),
            title: const Text('Academic Pathway'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AcademicPathway()),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            ),

          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () async {
              bool loggedOut = await logout();
              if (loggedOut) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageView(),),);
              }
            },
          ),
        ],
      ),
    );
  }

  void updateInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getProfile();
    setState(() {
      name = sharedPreferences.getString('nome')!;
      email = 'up'+ sharedPreferences.getString('codigo')! + '@up.pt';
    });
  }

}