import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget 
{
  const App({Key? key}) : super(key: key);

  @override
  
  Widget build(context) 
  {
    return Provider(
      child: const MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}