import 'signInscreen.dart';

import 'HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, user) {
            if (user.hasData) {
              return const HomePage();
            } else {
              return SignInPage();
            }
          }),
    );
  }
}
