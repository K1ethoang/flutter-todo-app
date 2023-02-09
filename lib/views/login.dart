import 'package:flutter/material.dart';
import 'package:kr_todo_app/style/app_style.dart';
import 'package:kr_todo_app/views/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(height: 10),
            const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "To-do List",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                  color: AppStyle.greyColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: AppStyle.orangeColor.withOpacity(0.23),
                    ),
                  ]),
              child: TextField(
                cursorColor: AppStyle.orangeColor,
                keyboardType: TextInputType.text,
                style: TextStyle(color: AppStyle.orangeColor),
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(
                    color: AppStyle.orangeColor.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppStyle.orangeColor),
                foregroundColor:
                    MaterialStatePropertyAll<Color>(AppStyle.greyColor),
                textStyle: const MaterialStatePropertyAll<TextStyle>(
                  TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              child: const Text("Continue"),
            ),
          ]),
        ),
      ),
    );
  }
}
