import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<Todo>>> getTasks();
  Future<Either<Failure, Todo>> getTask(String id);
  Future<Either<Failure, Todo>> createTask(Todo task);
  Future<Either<Failure, Todo>> markTask(Todo task);
  Future<Either<Failure, Todo>> updateTask(
      {required String id,
      String? name,
      String? description,
      DateTime? duedate});
  Future<Either<Failure, Todo>> deleteTask(String id);
}
