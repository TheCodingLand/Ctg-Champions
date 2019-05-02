import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/authentication.dart';
import 'splash/splash.dart';
import 'pages/login/login.dart';
import 'pages/match_list/index.dart';
import 'common/common.dart';
import 'Routes.dart';

import 'inheritedMatchList.dart';
import 'inheritedUserWidget.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    //print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    //print(error);
  }
}

void main() {
  Routes.initRoutes();

  BlocSupervisor().delegate = SimpleBlocDelegate();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Champions(userRepository: UserRepository()));
  });
}

class Champions extends StatefulWidget {
  final UserRepository userRepository;

  Champions({Key key, @required this.userRepository}) : super(key: key);

  createState() => _Champions();
}

class _Champions extends State<Champions> {
  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;
  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        bloc: _authenticationBloc,
        child: MyInheritedMatchListWidget(
            child: MyInheritedUserWidget(
            child: MaterialApp(
            title: 'CTG Champions',
            theme: ThemeData(
              brightness: Brightness.light,
              
              primaryColor: Colors.teal[700],

              accentColor: Colors.white,
  
                //primarySwatch: Colors.teal
                ),
            home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: _authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationUninitialized) {
                  return SplashPage();
                }
                if (state is AuthenticationAuthenticated) {
                  return HomePage();
                }
                if (state is AuthenticationUnauthenticated) {
                  return LoginPage(userRepository: _userRepository);
                }
                if (state is AuthenticationLoading) {
                  return LoadingIndicator();
                }
              },
            ),
          ),
        )));
  }
}

// This widget is the root of your application.
