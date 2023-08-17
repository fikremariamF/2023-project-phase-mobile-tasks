import '../../domain/entities/task.dart';
import '../model/task_model.dart';

abstract class TaskRemoteDatasource {
  Future<List<TodoModel>> getTasks();
  Future<TodoModel> getTask(String id);
  Future<TodoModel> createTask(Todo task);
  Future<TodoModel> markTask(Todo task);
  Future<TodoModel> updateTask(
      {required String id,
      String? name,
      String? description,
      DateTime? duedate});
  Future<TodoModel> deleteTask(String id);
}
