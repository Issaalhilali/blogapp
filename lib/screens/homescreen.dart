import 'package:blogapp/Authencation.dart';
import 'package:blogapp/widget/colortheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.auth,
    this.onSignedOut,
  });
  final AuthImpementaion auth;
  final VoidCallback onSignedOut;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _logoutUser() async{

  try{
    await widget.auth.signOut();
    widget.onSignedOut();
  }catch{

  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: Icon(Icons.local_car_wash),
                iconSize: 35,
                color: Colors.white,
                onPressed: _logoutUser,
              ),
              IconButton(
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: null)
            ],
          ),
        ),
      ),
    );
  }
}
