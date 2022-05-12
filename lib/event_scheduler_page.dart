import 'package:flutter/material.dart';

class EventSchedulerPage extends StatefulWidget {
  const EventSchedulerPage({Key? key}) : super(key: key);

  @override
  State<EventSchedulerPage> createState() => _EventSchedulerPageState();
}

class _EventSchedulerPageState extends State<EventSchedulerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: const Center(child: Text('Temp page')),
    );
  }
}
