import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kr_todo_app/models/todo.dart';

class DatabaseServices {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('Todos');

  // Add new todo
  Future createNewTodo({required Todo todo}) async {
    // Tham chiếu tới document
    final docTodo = todoCollection.doc();
    final json = {
      "todo_id": docTodo.id,
      "todo_title": todo.title,
      "isComplete": todo.isComplete,
    };
    // tạo document và ghi dữ liệu lên Firebase
    await docTodo.set(json);
  }

  Future completeTodo({required String todoID}) async {
    await todoCollection.doc(todoID).update({"isComplete": true});
  }

  Future unCompleteTodo({required String todoID}) async {
    await todoCollection.doc(todoID).update({"isComplete": false});
  }

  // Delete
  Future deleteTodo({required String todoID}) async {
    await todoCollection.doc(todoID).delete();
  }

  List<Todo> getTodoFromFirestore(QuerySnapshot? snapshot) {
    List<Todo> todo = [];
    if (snapshot != null) {
      todo = snapshot.docs.map((e) {
        return Todo(
          todoID: (e.data() as dynamic)["todo_id"],
          title: (e.data() as dynamic)["todo_title"],
          isComplete: (e.data() as dynamic)["isComplete"],
        );
      }).toList();
    }
    return todo; // tạo một danh sách rỗng và động
  }

  Stream<List<Todo>> listTodos() {
    return todoCollection.snapshots().map(getTodoFromFirestore);
  }
}
