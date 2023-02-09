import 'package:flutter/material.dart';
import 'package:kr_todo_app/views/home.dart';
import 'package:kr_todo_app/views/login.dart';
import 'package:kr_todo_app/views/todo_complete.dart';

import '../views/todo_add_update.dart';

Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  TodoAddUpdateScreen.routeName: (context) => const TodoAddUpdateScreen(),
  TodoCompletedScreen.routeName: (context) => const TodoCompletedScreen(),
};
