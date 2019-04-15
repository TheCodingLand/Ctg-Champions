import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Function login;
  //SignIn(this.login);
  SignIn(this.login);

  @override
  Widget build(BuildContext context) {
    return (
      InkWell(
        onTap: () { login(); } ,
        child:

      Container(

      width: 320.0,
      height: 60.0,
      margin: EdgeInsets.all(50),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 155, 122, 1.0),
        borderRadius: BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: Text(
        "Sign In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    )));
  }
}
