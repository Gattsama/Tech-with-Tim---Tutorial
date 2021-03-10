import 'package:flutter/material.dart';
import 'package:tech_with_tim_tutorial/my_home_page.dart';

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
  String loginName;
  TextEditingController _controller = TextEditingController();

  void click() {
    loginName = _controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(loginName)));
  }

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
