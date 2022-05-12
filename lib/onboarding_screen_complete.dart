import 'package:flutter/material.dart';
import 'package:productivity_app/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'colors.dart';

class OnboardingScreenComplete extends StatefulWidget {
  const OnboardingScreenComplete({Key? key}) : super(key: key);

  @override
  State<OnboardingScreenComplete> createState() => _OnboardingScreenCompleteState();
}

class _OnboardingScreenCompleteState extends State<OnboardingScreenComplete> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();

    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          // ignore: avoid_unnecessary_containers
          body: Container(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 4);
              },
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background_2.png'),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 240, left: 30, right: 30),
                          child: Text(
                            'Welcome to Productivity App',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 50,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'The app that boosts your productivity and aids your organisation.',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background_3.png'),
                  )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 10, right: 10),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/chronometer.png'))),
                          ),
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                        const Center(
                          child: Text(
                            'Task Timer',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 140),
                          child: Center(
                            child: Text(
                              'Be productive with the task timer feature. Effectively lay out your working timeand resting timeusing the Pomodoros method. Never feel lazy again!',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background_3.png'),
                  )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 10, right: 10),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/tasks.png'))),
                          ),
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                        const Center(
                          child: Text(
                            'Priority To-do List',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 140),
                          child: Center(
                            child: Text(
                              'Plan your day right from the moment you wake up and always be confident that you\'ll get everything done. Completing the most important things first, maximise your efficiency!',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background_3.png'),
                  )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 10, right: 10),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/timetable.png'))),
                          ),
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                        const Center(
                          child: Text(
                            'Event Scheduler',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 140),
                          child: Center(
                            child: Text(
                              'Don\'t ever worry about missing deadlines, appointments or meetings again. Have all your plans in one placewith our scheduler. Check your availability and set reminders too!',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background_4.png'),
                  )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 320, left: 10, right: 10),
                    child: Column(
                      children: const [
                        Center(
                          child: Text(
                            'And many more features...',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 180),
                          child: Center(
                            child: Text(
                              'Hop right in!',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: isLastPage
              ? Container(
                  color: mainGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  child: Center(
                    child: SizedBox(
                      height: 60,
                      width: 200,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text(
                            'Get Started',
                            style: TextStyle(color: mainGreen, fontSize: 18),
                          )),
                    ),
                  ),
                )
              : Container(
                  // color: const Color.fromRGBO(53, 159, 138, 100),
                  color: mainGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.jumpToPage(4);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      Center(
                        child: SmoothPageIndicator(
                            controller: controller, count: 5),
                      ),
                      SizedBox(
                        width: 90,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(53, 159, 138, 100)),
                            )),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
