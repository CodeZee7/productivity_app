// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
/*   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose;
  } */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background_3.png'),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(53, 159, 138, 100),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 30),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(53, 159, 138, 100),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: const OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 55,
                width: 190,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: logIn,
                    /* onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnboardingScreen()));
                    }, */
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
              const Spacer(),
              SizedBox(
                height: 55,
                width: 190,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
