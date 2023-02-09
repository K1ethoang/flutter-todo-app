import 'package:flutter/material.dart';
import 'package:kr_todo_app/models/todo.dart';
import 'package:kr_todo_app/services/database_service.dart';
import 'package:kr_todo_app/views/loading.dart';
import 'package:kr_todo_app/style/app_style.dart';
import 'package:kr_todo_app/views/todo_add_update.dart';
import 'package:kr_todo_app/views/todo_complete.dart';
import 'package:kr_todo_app/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width; // todo lên mạng xem
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.bg1Color,
        elevation: 6.0,
        leading: IconButton(
          onPressed: () {
            showAlertDialog(context);
          },
          icon: const Icon(Icons.help),
        ),
        title: Text(
          "All todos",
          style: AppStyle.appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TodoCompletedScreen.routeName);
            },
            icon: const Icon(Icons.archive),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(0, 0),
          child: Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(height: 2),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, TodoAddUpdateScreen.routeName);
          },
          backgroundColor: AppStyle.orangeColor,
          child: const Icon(
            Icons.add,
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            // SearchBox(),
            // const SizedBox(
            //   height: 10,
            // ),
            StreamBuilder<List<Todo>>(
                stream: DatabaseServices().listTodos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loading();
                  }
                  if (snapshot.hasData) {
                    List<Todo> todos = (snapshot.data!)
                        .where((todo) => todo.isComplete == false)
                        .toList();
                    if (todos.isEmpty) {
                      return const Center(
                        child: Text(
                            "Tap to the bottom right to create a new todo"),
                      );
                    }
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        itemCount: todos.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TodoTile(todo: todos[index]);
                        },
                      ),
                    );
                  }
                  return const Center();
                }),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(fontSize: 18, color: AppStyle.bg1Color),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("How to use?"),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text("1. Add: Tap to the bottom right button to create a new todo."),
        Text("2. Complete/Uncomplete: Long hold on todo item."),
        Text("3. Delete: Swipe left."),
        Text("4. Edit: Swipe right."),
        Text("5. See todo completed: Tap to the top right button to see."),
      ],
    ),
    actionsAlignment: MainAxisAlignment.center,
    backgroundColor: AppStyle.orangeColor,
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Search
Widget SearchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: AppStyle.greyColor, borderRadius: BorderRadius.circular(20)),
    child: TextField(
      cursorColor: AppStyle.orangeColor,
      style: TextStyle(
        color: AppStyle.bg1Color,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: AppStyle.blackColor,
          size: 20,
        ),
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 20, minWidth: 25),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(
          color: AppStyle.bg1Color,
        ),
      ),
    ),
  );
}
