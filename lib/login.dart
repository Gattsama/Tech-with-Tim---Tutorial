import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_with_tim_tutorial/my_home_page.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome - TWT Login'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user;

  // OLD CODE FOR TEXTFIELD DATA VARIABLE
  String loginName;
  // TextEditingController _controller = TextEditingController();

  void click() {
    SignInMethods().singInWithGoogle().then((user) {
      print('LOOK HERE');
      print(user.user.displayName);
      // Navigator.push(context,
      // MaterialPageRoute(builder: (context) => MyHomePage(user.toString()) ));
    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(user.displayName)));
  }

  // Widget googleLoginButton() {
  //   return OutlinedButton(
  //       onPressed: () {
  //         click();
  //       },
  //       child: child);
  // }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 5.0, color: Colors.black),
            ),
            labelText: 'Enter User Name',
            prefixIcon: Icon(Icons.person),
            suffixIcon: IconButton(
              icon: Icon(Icons.done),
              splashColor: Colors.blue,
              tooltip: 'Submit',
              onPressed: click,
            ),
          ),
        ),
      ),
    );
  }
}
