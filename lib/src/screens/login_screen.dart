import 'package:flutter/material.dart';
import '../mixins/validate_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidateMixin {

  String email;
  String password;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: 100.0),),
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0),),
            raisedButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
         email = value;
      },
      decoration: const InputDecoration(
       
        hintText: "you@example.com",
        labelText: "Email Address"
      ),
      validator: validateEmail,
    );

  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value){
       password = value;

      },
      decoration: const InputDecoration(
        hintText: "password",
        labelText: "Password"
      ),
      validator: validatePassword,
    );
  }

  Widget raisedButton() {
    return RaisedButton(
      onPressed: (){
       if(formKey.currentState.validate()){
         formKey.currentState.save();
         print('here is email and password $email:$password');
       }
      },
      child: Text('Submit'),
    );
  }
}
