import 'package:firebase_auth/firebase_auth.dart';
import 'package:firforfir/main.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    late final EmaiController;
    late final PasswordController;

    setState(() {
      EmaiController = TextEditingController();
      PasswordController = TextEditingController();
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            return Column(
              children: [
                TextField(
                  controller: EmaiController,
                ),
                TextField(
                  controller: PasswordController,
                ),
                TextButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: EmaiController.text,
                                password: PasswordController.text);
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                      }
                    },
                    child: const Text('signin')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: const Text('Create an account'))
              ],
            );
          },
        ));
  }
}
