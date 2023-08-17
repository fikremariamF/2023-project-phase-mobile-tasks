import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

class MarkTask {
  final TaskRepository repository;
  MarkTask(this.repository);

  Future<Either<Failure, Todo>> markTask(Todo todo) async {
    return await repository.markTask(todo);
  }
}
