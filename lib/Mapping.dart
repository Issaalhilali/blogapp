import 'package:blogapp/Authencation.dart';
import 'package:blogapp/screens/homescreen.dart';
import 'package:blogapp/screens/loginRegisterPage.dart';
import 'package:flutter/material.dart';

class MappingPage extends StatefulWidget {
  final AuthImpementaion auth;

  MappingPage({this.auth});

  @override
  _MappingPageState createState() => _MappingPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _MappingPageState extends State<MappingPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserId) {
      setState(() {
        authStatus = firebaseUserId == null
            ? AuthStatus.notSignedIn
            : AuthStatus.signedIn;
      });
    });
  }

  void _signedId() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginRegisterPager(auth: widget.auth, onSignedIn: _signedId);
      case AuthStatus.signedIn:
        return HomeScreen(auth: widget.auth, onSignedOut: _signedOut);
    }

    return Container();
  }
}
