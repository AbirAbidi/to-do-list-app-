import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/pages/home_page.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        splashColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

