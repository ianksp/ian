import 'package:flutter/material.dart';
import 'package:ianksp/screens/authenticate/authenticate.dart';
import 'package:ianksp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:ianksp/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<User>(context);
    print(user);
    
    //to return either home or authenticate
    if (user == null) {    
    return Authenticate();
    }else{
      return Home();
    } 
    
  }
}