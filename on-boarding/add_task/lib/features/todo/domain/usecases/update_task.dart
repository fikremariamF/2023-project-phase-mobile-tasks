import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

class  UpdateTasks {
  final TaskRepository repository;
  UpdateTasks(this.repository);

  Future<Either<Failure, Todo>> updateTask(
      {required String id,
      String? name,
      String? description,
      DateTime? duedate}) async {
    final response = await repository.updateTask(
      id: id,
      name: name,
      description: description,
      duedate: duedate,
    );

    return response.fold(
      (failure) => Left(UnknownFailure()),
      (task) {
        return Right(task);
      },
    );
  }
}

