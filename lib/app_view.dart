import 'package:firebase_tinder/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_tinder/components/persistent_nav.dart';
import 'package:firebase_tinder/screens/auth/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase Auth',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              surface: Colors.white,
              onSurface: Colors.black,
              primary: Color.fromRGBO(248, 22, 79, 1),
              onPrimary: Colors.black,
              secondary: Color.fromRGBO(55, 100, 91, 1),
              onSecondary: Colors.white,
              tertiary: Color.fromRGBO(255, 204, 128, 1),
              error: Colors.red,
              outline: Color(0xFF424242)),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const PersistentTabScreen();
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
