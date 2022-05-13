import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productivity_app/colors.dart';
import 'package:productivity_app/contact_developer.dart';
import 'package:productivity_app/event_scheduler_page.dart';
import 'package:productivity_app/main_page.dart';
import 'package:productivity_app/settings_page.dart';
import 'package:productivity_app/task_timer_page.dart';
import 'package:productivity_app/todo_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = FirebaseAuth.instance.currentUser;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/home_page_bg.png'))),
          child: Scaffold(
            drawer: Drawer(
              backgroundColor: darkBG,
              child: Wrap(
                children: [
                  buildHeader(context, user!),
                  buildMenuItems(context),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Builder(
                  builder: (context) => Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: darkBG,
                            size: 35,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      )),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: darkBG,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        width: 90,
                        height: 90,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        // 'Welcome ${user.displayName}',
                        'Welcome\n ${user.displayName}',
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 15.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Day',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        'May 2022',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                        textAlign: TextAlign.start,
                                      ),
                                      Center(
                                        child: Text(
                                          '12',
                                          style: TextStyle(
                                              fontSize: 65,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        'Time left',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        '8:20:04',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                height: 210,
                                width: 150,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 15.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TodoListPage()));
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'To do today',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Text(
                                            'Go to list',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                            textAlign: TextAlign.start,
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                height: 160,
                                width: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 15),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EventSchedulerPage()));
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Events this week',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Text(
                                            'Go to calendar',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                            textAlign: TextAlign.start,
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Center(
                                  child: Image.asset(
                                    'assets/meditation.png',
                                  ),
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              height: 210,
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactDevloper()));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Talk to the developer!',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              'Send feedback or ask questions to the developer of this app.',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            Row(
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 8.0, left: 8),
                                  child: Text(
                                    'Contact him now',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, User user) => Container(
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/drawer_header.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              height: 90,
              width: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 14, right: 14),
              child: Text(
                '${user.displayName}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            Text(
              user.email!,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height - 40,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Back to home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.timer_outlined,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Task Timer',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Pomodoro timer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskTimerPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.list_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Priority To-do List',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Complete tasks',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoListPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_today_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Event Scheduler',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Calendar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EventSchedulerPage()));
              },
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 50,
            ),
            /* 
            const Spacer(), */
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(
                Icons.mail_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Contact developer',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Get in touch',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactDevloper()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Edit settings',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.red,
                size: 35,
              ),
              title: const Text(
                'Sign Out',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  FirebaseAuth.instance.signOut();
                });
              },
            ),
          ],
        ),
      );
}
