import 'package:flutter/material.dart';

class ContactDevloper extends StatefulWidget {
  const ContactDevloper({Key? key}) : super(key: key);

  @override
  State<ContactDevloper> createState() => _ContactDevloperState();
}

class _ContactDevloperState extends State<ContactDevloper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.yellow,
      child: const Center(
        child: Text('Contact developer'),
      ),
    );
  }
}
