import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflashchat/register/bloc/register_bloc.dart';
import 'package:flutterflashchat/register/register_form.dart';
import 'package:flutterflashchat/repositories/user_repository.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = "registration_screen";

  final UserRepository _userRepository;

  RegistrationScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: _userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
