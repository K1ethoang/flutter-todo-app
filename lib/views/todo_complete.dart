import 'package:flutter/material.dart';
import 'package:kr_todo_app/models/todo.dart';
import 'package:kr_todo_app/services/database_service.dart';
import 'package:kr_todo_app/style/app_style.dart';
import 'package:kr_todo_app/views/loading.dart';
import 'package:kr_todo_app/widgets/todo_tile.dart';

class TodoCompletedScreen extends StatelessWidget {
  const TodoCompletedScreen({Key? key}) : super(key: key);

  static const routeName = '/todo_completed_screen';

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width; // todo lên mạng xem
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: AppStyle.bg1Color,
        elevation: 6.0,
        title: Text(
          "Todo completed",
          style: AppStyle.appBarTitle,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(0, 0),
          child: Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(height: 2),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            StreamBuilder<List<Todo>>(
                stream: DatabaseServices().listTodos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loading();
                  }
                  if (snapshot.hasData) {
                    List<Todo> todos = (snapshot.data!)
                        .where((todo) => todo.isComplete == true)
                        .toList();
                    if (todos.isEmpty) {
                      return const Center(
                        child: Text("No completed todos."),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
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
