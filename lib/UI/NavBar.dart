import 'package:flutter/material.dart';
import 'package:sigarraio/UI/personalschedule.dart';
import 'package:sigarraio/UI/settings.dart';
import 'package:sigarraio/UI/welcomepage.dart';

import '../controller/logout_action.dart';
import 'academicpathway.dart';
import 'homepage.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: const Text('Username',style: TextStyle(color: Colors.black),),
            accountEmail: const Text('example@gmail.com',style: TextStyle(color: Colors.black),),
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
              MaterialPageRoute(builder: (context) => MyStatefulWidgeta()),
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage(),),);
              }
            },
          ),
        ],
      ),
    );
  }
}