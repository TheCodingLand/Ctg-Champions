import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';
import 'package:champions/authentication/authentication.dart';
import 'package:champions/ThemeBis.dart' as Theme;
import 'SignInButton.dart';

import 'package:champions/common/InputFields.dart';
import 'package:flare_flutter/flare_actor.dart';
class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;
  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc get _loginBloc => widget.loginBloc;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (
          BuildContext context,
          LoginState state,
        ) {
          if (state is LoginFailure) {
            _onWidgetDidBuild(() {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            });
          }

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InputFieldArea(
                      controller: _usernameController,
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
                    state is LoginLoading
                        ? Container(
                          width: 150,
                          height: 150,
                            padding: EdgeInsets.only(top: 50),
                            child: 
                            //FlareActor("assets/animations/Success Check.flr2d", fit: BoxFit.contain, animation: "Untitled",))
                             CircularProgressIndicator(
                                 valueColor: AlwaysStoppedAnimation<Color>(
                                     Theme.Colors.ctgColor)))
                        : SignIn(_onLoginButtonPressed),
                  ],
                )),
              ],
            ),
          );
        });
  }
}
