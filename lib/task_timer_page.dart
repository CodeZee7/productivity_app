import 'package:flutter/material.dart';
import 'package:productivity_app/colors.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'settings_page.dart';

class TaskTimerPage extends StatefulWidget {
  const TaskTimerPage({Key? key}) : super(key: key);

  @override
  State<TaskTimerPage> createState() => _TaskTimerPageState();
}

class _TaskTimerPageState extends State<TaskTimerPage> {
  final timerController = CountDownController();
  bool workingTimer = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
          ),
          title: const Text(
            'Pomodoro Task Timer',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: mainGreen,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: darkBG,
          onPressed: () {
            timerController.start();
          },
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        backgroundColor: darkBG,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'Task Name',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: NeonCircularTimer(
                    controller: timerController,
                    width: 250,
                    strokeWidth: 15,
                    duration: workingTimer ? 20 : 5,
                    onComplete: () {},
                    neumorphicEffect: true,
                    backgroudColor: darkBG,
                    autoStart: false,
                    textStyle: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: mainGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text('20',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60,
                                    )),
                                Text('Working',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35,
                                    )),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('05',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60,
                                    )),
                                Text('B r e a k',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            timerController.pause();
                          },
                          child: const Text(
                            'Pause',
                            style: TextStyle(
                                fontSize: 30,
                                color: mainGreen,
                                fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            timerController.resume();
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 30,
                                color: mainGreen,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
