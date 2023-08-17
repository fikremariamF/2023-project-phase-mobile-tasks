import '../model/task_model.dart';

abstract class TaskLocalDatasource {
  Future<TodoModel> getTask();
  Future<void> cacheTask(TodoModel todo);
}


