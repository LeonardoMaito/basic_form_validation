import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(context){
    return const MaterialApp(
      title: 'Form Validation',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}