import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflashchat/repositories/user_repository.dart';
import 'package:flutterflashchat/screens/chat_screen.dart';
import 'package:flutterflashchat/screens/login_screen.dart';
import 'package:flutterflashchat/screens/splash_screen.dart';

import 'auth/auth_block/authentication_bloc.dart';
import 'auth/simple_bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AuthenticationStarted()),
      child: App(
        userRepository: userRepository,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashScreen();
          }
          if (state is AuthenticationSuccess) {
            return ChatScreen();
          }
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: _userRepository);
          }
          return Container();
        },
      ),
    );
  }
}
