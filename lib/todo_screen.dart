import 'package:flutter/material.dart';
import 'package:to_do_list/todo_item_service.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo_provider.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do Liste'),
      ),
      body: ListView.builder(
        itemCount: toDoProvider.todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(toDoProvider.todos[index].name),
            leading: Checkbox(
              value: toDoProvider.todos[index].isDone,
              onChanged: (newValue) {
                toDoProvider.updateStatus(index, newValue!);
          
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoItem(toDoProvider, context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem(ToDoProvider provider, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String newItemName = '';
        return AlertDialog(
          title: const Text('New To-Do Item'),
          content: TextField(
            onChanged: (value) {
              newItemName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                provider.addToDo(TodoItem(newItemName, false));

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
