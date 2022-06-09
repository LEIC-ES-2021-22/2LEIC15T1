import 'package:flutter/material.dart';
import '../model/Profile.dart';
import 'NavBar.dart';
import 'package:settings_ui/settings_ui.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsStatus();
}

class SettingsStatus extends State<Settings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Settings',style:TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: buildSettingsList(),
      ),
    );
  }
}

Widget buildSettingsList() {
  return SettingsList(
    sections: [
      SettingsSection(
        title: Text('Common'),
        tiles: [
          SettingsTile(
            title: Text('Environment'),
            leading: Icon(Icons.cloud_queue),
          ),
        ],
      ),
      SettingsSection(
        title: Text('Account'),
        tiles: [
          SettingsTile(title: Text('Phone number'), leading: Icon(Icons.phone)),
          SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
          SettingsTile(title: Text('Sign out'), leading: Icon(Icons.exit_to_app)),
        ],
      ),
      SettingsSection(
        title: Text('Misc'),
        tiles: [
          SettingsTile(
              title: Text('Terms of Service'), leading: Icon(Icons.description)),
          SettingsTile(
              title: Text('Open source licenses'),
              leading: Icon(Icons.collections_bookmark)),
        ],
      ),
    ],
  );
}

/*
          SettingsTile(
            title: Text('Language'),
            leading: Icon(Icons.language),
            onPressed: (context) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LanguagesScreen(),
              ));
            },
          ),
          CustomTile(
            child: Container(
              color: Color(0xFFEFEFF4),
              padding: EdgeInsetsDirectional.only(
                start: 14,
                top: 12,
                bottom: 30,
                end: 14,
              ),
              child: Text(
                'You can setup the language you want',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.5,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
 */