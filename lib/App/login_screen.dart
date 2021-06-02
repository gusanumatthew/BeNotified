import 'package:be_notified/App/admin_screen.dart';
import 'package:be_notified/App/user_screen_nav.dart';
import 'package:be_notified/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String id = '';
  String pass = '';

  void loginUser(String id, String pass) {
    for (var user in listOfUsers) {
      if (user.identificationNumber == id && user.password == pass) {
        //login
        if (user.isAdmin == true) {
          // navigate to Admin panel
          Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
        } else {
          //navigate to User panel
          Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
        }
      } else {
        // throw an error
        print('invalid account/password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Image.asset(
                'images/l1.png',
                height: 90,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 55.0),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black87),
                onChanged: (val) {
                  id = val;
                  print(val);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xCCFFFFFF),
                  hintText: 'Matric Number/Employee Number',
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDB3942), width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black87),
                onChanged: (val) {
                  pass = val;
                  print(val);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xCCFFFFFF),
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDB3942), width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(15),
                color: Color(0xFFDB3942),
                textColor: Colors.white,
                onPressed: () {
                  loginUser(id, pass);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
