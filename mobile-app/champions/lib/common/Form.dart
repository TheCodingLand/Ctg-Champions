import 'package:flutter/material.dart';
import './InputFields.dart';

class FormContainer extends StatefulWidget {
  final Function getUserName;
  final Function getPassword;
  FormContainer(this.getUserName, this.getPassword);


 @override
  _FormControlState createState() => _FormControlState();

}



class _FormControlState extends State<FormContainer> {
  
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _username = "";
  String _password = "";
  _FormControlState() {
   
    void _userListener() {
      if (_userNameController.text.isEmpty) { 
        _username="";
        } else {
          widget.getUserName(_username);
        _username = _userNameController.text;

        }
      }
    void _passwordlistener() {
      if (_passwordController.text.isEmpty) { 
        _password="";
        } else {
          widget.getPassword(_username);
        _password = _passwordController.text;

        }
      }  

      _userNameController.addListener(_userListener);
      _passwordController.addListener(_passwordlistener);
      

    }
  @override
  void initState() {
    super.initState();
    _password = _password ?? "";
    _username = _username ?? "";
  }
  



  @override
  

  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              
              InputFieldArea(
                controller: _userNameController,
                hint: "Username",
                obscure: false,
                icon: Icons.person_outline,
              ),
              InputFieldArea(
                controller: _passwordController,
                hint: "Password",
                obscure: true,
                icon: Icons.lock_outline,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
