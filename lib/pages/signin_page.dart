import 'package:book_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:book_app/services/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class SigninPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SigninPageState();
  }
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey<FormState> _loginFormKey = GlobalKey();

  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Book Buddy📚',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              // initialValue: "kminchelle",
              onSaved: (value) {
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a username";
                }
              },
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextFormField(
              // initialValue: "0lelplR",
              obscureText: true,
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              },
              validator: (value) {
                if (value == null || value.length < 5) {
                  return "Enter a valid password";
                }
              },
              decoration: InputDecoration(hintText: "Password"),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: () async {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();

            bool result = await AuthService().login(username!, password!);
            // print(result);
            if (result) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {
              StatusAlert.show(context,
                  duration: const Duration(seconds: 2),
                  title: "Sign in failed",
                  subtitle: "Please try again",
                  configuration: const IconConfiguration(
                    icon: Icons.error,
                  ),
                  maxWidth: 260);
            }
          }
        },
        child: const Text("Sign In"),
      ),
    );
  }
}
