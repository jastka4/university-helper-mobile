import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsos_helper/blocs/authentication/authentication.dart';
import 'package:jsos_helper/blocs/login/login.dart';
import 'package:jsos_helper/repositories/storage_repository.dart';
import 'package:jsos_helper/repositories/user_repository.dart';
import 'package:jsos_helper/ui/components/login_form.dart';

class LoginPage extends StatelessWidget {
  final StorageRepository storageRepository;
  final UserRepository _userRepository;

  LoginPage({Key key, @required this.storageRepository})
      : assert(storageRepository != null),
        _userRepository = UserRepository(storageRepository: storageRepository),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: _userRepository,
          );
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.red[900], Colors.amber[600]],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
