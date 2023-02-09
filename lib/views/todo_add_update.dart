import 'package:flutter/material.dart';
import 'package:kr_todo_app/services/database_service.dart';
import 'package:kr_todo_app/style/app_style.dart';
import '../models/todo.dart';

class TodoAddUpdateScreen extends StatefulWidget {
  final Todo? todo;
  const TodoAddUpdateScreen({Key? key, this.todo}) : super(key: key);

  static const routeName = '/add_todo_screen';

  @override
  State<TodoAddUpdateScreen> createState() => _TodoAddUpdateScreenState();
}

class _TodoAddUpdateScreenState extends State<TodoAddUpdateScreen> {
  @override
  bool get mounted => super.mounted;

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColor,
      appBar: AppBar(
        backgroundColor: AppStyle.bg1Color,
        elevation: 6.0,
        title: Text(
          "Add a new todo",
          style: AppStyle.appBarTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                if (_titleController.text.isNotEmpty) {
                  Todo todo = Todo(
                    title: _titleController.text.trim(),
                    // alertTime: _alertTime,
                  );
                  await DatabaseServices().createNewTodo(todo: todo);
                  if (mounted) Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.check))
        ],
        bottom: PreferredSize(
          preferredSize: const Size(0, 0),
          child: Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(height: 2),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: TextField(
          autofocus: true,
          controller: _titleController,
          cursorColor: AppStyle.orangeColor,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: "Title",
            labelStyle: TextStyle(color: AppStyle.greyColor, fontSize: 20),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppStyle.orangeColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppStyle.greyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
