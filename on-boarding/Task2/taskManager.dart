import 'task.dart';

class TaskManager {
  List<Task> _tasks = [];

  void addTask(Task task) {
    _tasks.add(task);
  }

  List<Task> getAllTasks() {
    return [..._tasks];
  }

  List<Task> getCompletedTasks() {
    return _tasks.where((task) => task.status == Status.completed).toList();
  }

  List<Task> getPendingTasks() {
    return _tasks.where((task) => task.status == Status.pending).toList();
  }

  void updateTaskStatus(int index, Status newStatus) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].status = newStatus;
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
    }
  }
}
