import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            const SizedBox(height: 20),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'E-Mail',
        hintText: 'exemplo@email.com',
      ),
      validator: validateEmail,
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Senha',
      ),
      validator: validatePassword,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          print('%email and %password');
        }
      },
      child: const Text('Entrar'),
    );
  }
}
