import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            leading: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            actions: const [
              TextField(

              )
            ],
          ),
        )
    );
  }
}
