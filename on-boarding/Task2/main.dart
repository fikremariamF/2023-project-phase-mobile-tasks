import 'dart:io';

import 'task.dart';
import 'taskManager.dart';

void main() {
  TaskManager taskManager = TaskManager();

  while (true) {
    print('1. Add task');
    print('2. View all tasks');
    print('3. View completed tasks');
    print('4. View pending tasks');
    print('5. Update task status');
    print('6. Delete task');
    print('7. Exit');
    print('Enter a choice:');

    var input = stdin.readLineSync();
    if (input == '1') {
      print('Enter task title:');
      var title = stdin.readLineSync();
      print('Enter task description:');
      var description = stdin.readLineSync();
      DateTime dueDate =  DateTime.parse(getInput('Enter due date (yyyy-mm-dd):'));
      ;
      taskManager.addTask(
          Task(title: title!, description: description!, dueDate: dueDate));
    } else if (input == '2') {
      taskManager
          .getAllTasks()
          .asMap()
          .forEach((index, task) => print('[$index] $task'));
    } else if (input == '3') {
      taskManager.getCompletedTasks().forEach(print);
    } else if (input == '4') {
      taskManager.getPendingTasks().forEach(print);
    } else if (input == '5') {
      taskManager
          .getAllTasks()
          .asMap()
          .forEach((index, task) => print('[$index] $task'));
      print('Enter the index of the task to update:');
      var index = int.parse(stdin.readLineSync()!);
      print('Enter new status (0 for completed, 1 for pending):');
      var status = int.parse(stdin.readLineSync()!);
      taskManager.updateTaskStatus(index, Status.values[status]);
    } else if (input == '6') {
      taskManager
          .getAllTasks()
          .asMap()
          .forEach((index, task) => print('[$index] $task'));
      print('Enter the index of the task to delete:');
      var index = int.parse(stdin.readLineSync()!);
      taskManager.deleteTask(index);
    } else if (input == '7') {
      break;
    } else {
      print('Invalid choice.');
    }
  }
}

String getInput(String prompt) {
  String input;
  do {
    print(prompt);
    input = stdin.readLineSync()!;
  } while (input.isEmpty);
  return input;
}
