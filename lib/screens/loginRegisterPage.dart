import 'package:blogapp/widget/colortheme.dart';
import 'package:flutter/material.dart';

class LoginRegisterPager extends StatefulWidget {
  @override
  _LoginRegisterPagerState createState() => _LoginRegisterPagerState();
}

class _LoginRegisterPagerState extends State<LoginRegisterPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        flexibleSpace: Themetht(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Login Blog App'),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[400],
          Colors.orange[600],
          Colors.orange[200],
        ])),
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInput() + createButton(),
          ),
        ),
      ),
    );
  }

  List<Widget> createInput() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 10.0,
      ),
      TextField(
        decoration: InputDecoration(labelText: 'Email'),
      ),
      SizedBox(
        height: 10.0,
      ),
      TextField(
        decoration: InputDecoration(labelText: 'Password'),
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('images/logoblog.jpg'),
      ),
    );
  }

  List<Widget> createButton() {
    return [
      RaisedButton(
          splashColor: Colors.orange,
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          textColor: Colors.white,
          color: Colors.green,
          onPressed: () {}),
      FlatButton(
          child: Text(
            'Not have an Account? Create Account',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          textColor: Colors.grey,
          onPressed: () {}),
    ];
  }
}
