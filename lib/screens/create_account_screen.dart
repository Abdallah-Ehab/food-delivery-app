import 'dart:developer';

import 'package:delivery_app/screens/log_in_screen.dart';
import 'package:delivery_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccountScreen> {
  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  late TextEditingController _confirmPassword;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Account"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, size: 50),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.mail)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Enter your password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller:_confirmPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "confirm password",
                    
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text("already have an account?  "),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LogInScreen()));
                          },
                          child: SizedBox(
                            child: Text("Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ))
                    ],
                  ),
                  MyButton(text: "Register", onTap: () {})
                ],
              ),
            ),
          ),
        ));
  }
}
