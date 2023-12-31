import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteTask {
  final TaskRepository repository;
  DeleteTask(this.repository);

  Future<Either<Failure, Todo>> deleteTask(String id) async {
    return await repository.deleteTask(id);
  }
}
