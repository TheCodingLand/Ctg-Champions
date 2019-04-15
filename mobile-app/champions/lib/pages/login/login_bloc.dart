import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


import 'package:champions/authentication/authentication.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

    
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        if (token == '') {
          yield LoginFailure(error: 'Authentification failure');
        }
        else{

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } 
      
      
    }
  }
}
