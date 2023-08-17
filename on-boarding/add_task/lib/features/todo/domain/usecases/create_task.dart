import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

class CreateTask {
  final TaskRepository repository;
  CreateTask(this.repository);

  Future<Either<Failure, Todo>> createTask(
      Todo todo) async {
    final response = await repository.createTask(
      todo
    );

    return response.fold(
      (failure) => Left(UnknownFailure()),
      (task) {
        return Right(task);
      },
    );
  }
}
