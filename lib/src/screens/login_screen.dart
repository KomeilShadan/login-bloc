import 'package:flutter/material.dart';
import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget 
{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  
  Widget build(context) 
  {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: const EdgeInsets.only(top: 25.0),),
          submitButton(bloc),
        ],),
    );
  }
  Widget emailField(Bloc bloc) 
  {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) => 
        TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@gmail.com',
            labelText: 'Email Address',
            errorText: snapshot.error?.toString(),
          ),
        ),
    );
  }
  Widget passwordField(Bloc bloc) 
  {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) => 
        TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'Password',
            errorText: snapshot.error?.toString(),
          ),
          obscureText: true,
        ),
    );
  }
  Widget submitButton(Bloc bloc)
  {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) => 
        ElevatedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: const Text('login'),
          style: ElevatedButton.styleFrom(primary: Colors.blue,),
        ),
      );
  }
}