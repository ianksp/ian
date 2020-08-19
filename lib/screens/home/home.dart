import 'package:flutter/material.dart';
import 'package:ianksp/services/auth.dart';

class Home extends StatelessWidget {
 final AuthService _auth =AuthService();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[40],
      appBar: AppBar( 
      title: Text('Kayoola Travel Express'),
      backgroundColor: Colors.green[380],
      elevation: 0.0,   
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('logout'),
          onPressed: () async {
            await _auth.signOut();

          },
        )
      ], 
      ),
   // child: Text('home'), 
    );
  }
}