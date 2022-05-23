import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold (
      backgroundColor: Colors.white,
      appBar : AppBar (
        title : Text("SigarraIO")
      ),
      body : SingleChildScrollView(
        child: Column (
          children : getWidgets()
        )
      )
    );
  }

  static final TextEditingController usernameController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();

  getWidgets() {
    final List<Widget> widgets = [];
    widgets.add(createUsernameInput());
  }

  Widget createUsernameInput(){
    return TextFormField(
      enableSuggestions: false,
      autofocus: false,
      controller : usernameController,
      textInputAction: TextInputAction.next,
      textAlign:TextAlign.left,
    );
  }
  }