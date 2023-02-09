import 'package:flutter/material.dart';
import 'package:kr_todo_app/models/todo.dart';
import 'package:kr_todo_app/services/database_service.dart';
import 'package:kr_todo_app/style/app_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../views/todo_add_update.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        key: Key(todo.todoID),
        // eidt
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(
                    context,
                    TodoAddUpdateScreen(
                      todo: todo,
                    ).routeName);
              },
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: "Edit",
            )
          ],
        ),
        // delete
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            DatabaseServices().deleteTodo(todoID: todo.todoID);
          }),
          children: [
            SlidableAction(
              onPressed: (e) {
                DatabaseServices().deleteTodo(todoID: todo.todoID);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            )
          ],
        ),
        child: buildTodo(context),
      );

  Widget buildTodo(BuildContext context) => InkWell(
        onLongPress: () async {
          if (todo.isComplete) {
            await DatabaseServices().unCompleteTodo(todoID: todo.todoID);
          } else {
            await DatabaseServices().completeTodo(todoID: todo.todoID);
          }
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            color:
                todo.isComplete ? AppStyle.cardDoneColor : AppStyle.cardColor,
            width: double.infinity,
            child: Text(
              todo.title,
              style:
                  todo.isComplete ? AppStyle.mainTitleDone : AppStyle.mainTitle,
            )),
      );
}
