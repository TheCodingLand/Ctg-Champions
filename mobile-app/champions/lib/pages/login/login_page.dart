import 'package:flutter/material.dart';
import 'styles.dart';

import 'package:champions/common/CtgLogo.dart';
import 'login.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:champions/authentication/authentication.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(body:
      Container(
        decoration: BoxDecoration(
          image: backgroundImage,
        ),
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(0, 0, 0, 1),
                const Color.fromRGBO(51, 51, 63, 0.1),
                const Color.fromRGBO(0, 0, 0, 0.1),
              ],
              stops: [0.2, 1, 1],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            )),
            child:
                ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
              

              

                    
                    
                    // Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                         
                                                   
                          AppLogo(),
                          
                          LoginForm(authenticationBloc: _authenticationBloc, loginBloc: _loginBloc),
                          
                       // ])
                  ])
            )))
    );
    }

    
 
  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
