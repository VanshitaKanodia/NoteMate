import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_mate/screens/collection_screen.dart';
import 'package:note_mate/screens/content_file.dart';
import 'package:note_mate/screens/login_screen.dart';
import 'package:note_mate/screens/note_card.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/collection_screen',
      routes: {
        '/login_screen': (context) => const LoginScreen(),
        '/collection_screen': (context) => const CollectionScreen(),
        '/content_screen': (context) => const ContentScreen(),
      },
    );
  }
}