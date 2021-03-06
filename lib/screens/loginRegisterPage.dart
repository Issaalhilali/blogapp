import 'package:blogapp/Authencation.dart';
import 'package:blogapp/screens/creatacoount.dart';
import 'package:blogapp/widget/colortheme.dart';
import 'package:flutter/material.dart';

class LoginRegisterPager extends StatefulWidget {
  LoginRegisterPager({this.auth, this.onSignedIn});
  final AuthImpementaion auth;
  final VoidCallback onSignedIn;
  @override
  _LoginRegisterPagerState createState() => _LoginRegisterPagerState();
}

enum FormType {
  login,
  register,
}

class _LoginRegisterPagerState extends State<LoginRegisterPager> {
  final formkey = GlobalKey<FormState>();
  FormType _formType = FormType.login;

  String _email = '';
  String _password = '';
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

  void moveToRegister() {
    formkey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formkey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  void vaildateAndSunmit() async {
    if (vaildateAndSave()) {
      try {
        if (formkey == FormType.login) {
          String userId = await widget.auth.SignIn(_email, _password);
          print('login userId = ' + userId);
        } else {
          String userId = await widget.auth.SignIn(_email, _password);
          print('Register userId = ' + userId);
        }
        widget.onSignedIn();
      } catch (e) {
        print("Error =" + e.toString());
      }
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
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 10.0,
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
        onChanged: (textValue) {
          setState(() {
            _password = textValue;
          });
        },
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
          hintText: 'Passowrd',
          hintStyle: TextStyle(color: Colors.black),
        ),
        obscureText: true,
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
    if (_formType == FormType.login) {
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
          onPressed: vaildateAndSave,
        ),
        FlatButton(
            child: Text(
              'Not have an Account? Create Account',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            textColor: Colors.grey,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAcconut()));
            }),
      ];
    }
  }
}
