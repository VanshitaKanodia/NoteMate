
import 'package:flutter/material.dart';
import 'package:note_mate/screens/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  void initState()
  {
    // super.initState();

    // Timer(
    //   const Duration(seconds: 1),
    //     () => Navigator.of(context as BuildContext).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => LoginScreen(),
    //   )
    // )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen(
    );
  }
}
