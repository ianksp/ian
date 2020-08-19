import 'package:flutter/material.dart';
import 'package:ianksp/services/auth.dart';

class SignIn extends StatefulWidget {
final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 final AuthService _auth =AuthService();
 final _formKey= GlobalKey<FormState>();
  String email ='';
  String password='';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[80],
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        //elevation: 0.0,
        title: Text('Login to KMC account\nmission vehicles made in uganda'),
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label:  Text('Register'),
            onPressed: (){  },
            )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Form(
          key:_formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator: (val) =>val.isEmpty?'Enter an email': null,
                //obscureText: true,
                onChanged:(val){
                  setState(() => email =val); 
                    
                  }
              ),

                  //TextFormField()           
              SizedBox(height: 18,),
              TextFormField(
                obscureText: true,
                 validator: (val) =>val.length<6?'password must contain atleast 6 characters': null,
                onChanged:(val){
                   setState(() => password =val);
                  //TextFormField()
                }
              ),
              SizedBox(height:16),
              RaisedButton(
                color: Colors.amber[200],
                child: Text( 'LOGIN',
                  style: TextStyle(color: Colors. pink),
                ),
                onPressed: ()async {
                  if (_formKey.currentState.validate()){
                   
                   //if (result == null){
                   //  setState(()=> error ='please supply a valid email');
                   //} 
                   // if (_formKey.currentState.validate()){

                      print('valid adress');
                  //print(email);
                  //print(password);
                    }
                }
                ),

                 SizedBox(height :12),
             Text(
               error,
               style: TextStyle(color: Colors.yellow, fontSize: 16),
             ),
            ],
          )
        ),

             ),
    );
  }
}
        /* RaisedButton(
          child: Text('Sign in anon'),
          onPressed:() async {
           dynamic result = await _auth.signInAnon();
            if (result == null){
              print('error in signing in');
            } else{
              print('signed in');
              print('result.uid');
            }
          
          
          }
        ),*/
   
