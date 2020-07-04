import 'package:blogapp/widget/colortheme.dart';
import 'package:flutter/material.dart';

import 'loginRegisterPage.dart';

class CreateAcconut extends StatefulWidget {
  @override
  _CreateAcconutState createState() => _CreateAcconutState();
}

class _CreateAcconutState extends State<CreateAcconut> {
  final formkey = GlobalKey<FormState>();

  String _email = '';
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool saveAttempted = false;

  bool vaildateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void vaildateAndSunmit() async {
    if (vaildateAndSave()) {
      try {
        if (formkey == FormType.login) {}
      } catch (e) {}
    }
  }

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
          key: formkey,
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
        height: 5.0,
      ),
      logo(),
      SizedBox(
        height: 5.0,
      ),
      TextFormField(
        autovalidate: saveAttempted,
        onChanged: (textValue) {
          setState(() {
            _email = textValue;
          });
        },
        validator: (emailValue) {
          if (emailValue.isEmpty) {
            return 'This field is mandatory';
          }
          String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
              "\\@" +
              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
              "(" +
              "\\." +
              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
              ")+";
          RegExp regExp = new RegExp(p);

          if (regExp.hasMatch(emailValue)) {
            // So, the email is valid
            return null;
          }

          return 'This is not a valid email';
        },
        decoration: InputDecoration(labelText: 'Email'),
      ),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        autovalidate: saveAttempted,
        controller: _pass,
        validator: (pwValue) {
          if (pwValue.isEmpty) {
            return 'This field is mandatory';
          }
          if (pwValue.length < 8) {
            return 'Passowrd must be at least 8 characters';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Passowrd',
          hintStyle: TextStyle(color: Colors.black),
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        autovalidate: saveAttempted,
        controller: _confirmPass,
        validator: (pwValue) {
          if (pwValue.isEmpty) {
            return 'This field is mandatory';
          }
          if (pwValue != _pass.text) {
            return 'Not same Passowrd';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Confirm Passowrd',
          hintStyle: TextStyle(color: Colors.black),
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 10,
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Text(
          'Create Account',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  List<Widget> createButton() {
    {
      return [
        RaisedButton(
          splashColor: Colors.orange,
          child: Text(
            'Create Account',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          textColor: Colors.white,
          color: Colors.green,
          onPressed: vaildateAndSave,
        ),
        FlatButton(
            child: Text(
              'Already have an Acconut? Login',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            textColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginRegisterPager()));
            }),
      ];
    }
  }
}
