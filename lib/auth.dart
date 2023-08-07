import 'package:firebase/home.dart';
import 'package:firebase/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class authService extends StatelessWidget {
  const authService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.connectionState ==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if (snapshot.hasData) {
              return homeScreen();
            } else {
              return const signIn();
            }
          }),
    );
  }
}