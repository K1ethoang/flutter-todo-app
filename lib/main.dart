import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_todo_app/routes/routes.dart';
import 'package:kr_todo_app/style/app_style.dart';
import 'package:kr_todo_app/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // status bar
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: "KR Todo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppStyle.orangeColor,
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: AppStyle.greyColor),
        scaffoldBackgroundColor: AppStyle.bg1Color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: const HomeScreen(),
    );
  }
}
