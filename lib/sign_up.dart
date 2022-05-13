// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/colors.dart';
import 'package:productivity_app/onboarding_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'database.dart';
import 'utils.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextFormField(
                        maxLength: 15,
                        controller: usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 3
                            ? 'Minimum 3 characters'
                            : null,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(53, 159, 138, 100),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                            hintText: 'Display Name',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 20),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email address'
                                : null,
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
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Minimum 6 characters'
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 190,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            signUp();
                          },
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
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            color: mainGreen,
            height: 80,
            child: Center(
              child: SizedBox(
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    // final docUser = FirebaseFirestore.instance.collection('users').doc();
    if (!isValid) return;
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      var user = result.user;
      user?.updateDisplayName(usernameController.text.trim());

      final json = {
        'name': usernameController.text.trim(),
      };

      await DatabaseService(uid: user!.uid).updateUserData(json);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
