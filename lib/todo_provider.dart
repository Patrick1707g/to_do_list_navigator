import 'package:flutter/material.dart';
import 'package:to_do_list/todo_item_service.dart';

class ToDoProvider extends ChangeNotifier{
    List<TodoItem> todos = [];

    void addToDo(TodoItem item){
        todos.add(item);
        notifyListeners();
    }

    void deleteToDO(int index){
        todos.removeAt(index);
        notifyListeners();
    }

    void updateStatus(int index, bool status){
        todos[index].isDone = status;
        notifyListeners();
    }
}