import 'package:flutter/material.dart';
import 'package:productivity_app/colors.dart';
import 'package:productivity_app/main_page.dart';

import 'sign_up.dart';

class AfterSplashscren extends StatefulWidget {
  const AfterSplashscren({Key? key}) : super(key: key);

  @override
  State<AfterSplashscren> createState() => _AfterSplashscrenState();
}

class _AfterSplashscrenState extends State<AfterSplashscren> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash_background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'))),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: 55,
                          width: 190,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            },
                            child: const Text(
                              '''Log in''',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18, color: mainGreen),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 190,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mainGreen),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          },
                          child: const Text(
                            'New User',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(flex: 4),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Developed by Zeeshan',
                  style: TextStyle(fontSize: 20, color: mainGreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
