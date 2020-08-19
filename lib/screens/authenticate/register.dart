import 'package:flutter/material.dart';
import 'package:ianksp/services/auth.dart';


class Register extends StatefulWidget {
 final Function toggleView;
  Register({this.toggleView});
 
 
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth =AuthService();
final _formKey= GlobalKey<FormState>();

 String email ='';
String password='';
String error =''; 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.blue[80],
      appBar: AppBar(
        backgroundColor: Colors.amber[250],
        elevation: 0.0,
        title: Text('Sign up to KMC'),
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label:  Text('Sign in'),
            onPressed: (){  
              widget.toggleView();
            },
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
                decoration: InputDecoration(
                  hintText: 'email',
                  fillColor: Colors.yellow,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0)
                  ),
                     focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 1.0)
                  )
                ),
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
                child: Text( 'Register hia',
                  style: TextStyle(color: Colors. pink),
                ),
                onPressed: ()async {
                 if (_formKey.currentState.validate()){
                   dynamic result =await _auth.registerWithEmailAndPassword(email, password);
                   if (result == null){
                     setState(()=> error ='please supply a valid email');
                   } 
                   
                   // print(email);
                   // print(password);

                }
              }
             ),
             SizedBox(height :12),
             Text(
               error,
               style: TextStyle(color: Colors.yellow, fontSize: 16),
             ),
            ],
          ),
        ),
        
     ),
    );
  }
}