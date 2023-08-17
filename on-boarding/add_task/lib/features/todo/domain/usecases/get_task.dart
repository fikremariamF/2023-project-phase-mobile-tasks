import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

class GetTasks {
  final TaskRepository repository;
  GetTasks(this.repository);

  Future<Either<Failure, Todo>> getTask(String id) async {
    return await repository.getTask(id);
  }
}
