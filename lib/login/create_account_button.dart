import 'package:flutter/material.dart';
import 'package:flutterflashchat/repositories/user_repository.dart';
import 'package:flutterflashchat/screens/registration_screen.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegistrationScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
