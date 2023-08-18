import 'package:add_task/core/error/exceptions.dart';
import 'package:add_task/core/platform/network_info.dart';
import 'package:add_task/features/todo/data/datasources/task_local_data_source.dart';
import 'package:add_task/features/todo/data/datasources/task_remote_datasource.dart';
import 'package:add_task/features/todo/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/task.dart';
import '../model/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDatasource remoteDatasource;
  final TaskLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl(
      {required this.remoteDatasource,
      required this.localDatasource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Todo>>> getTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final List<TodoModel> remoteTasks = await remoteDatasource.getTasks();
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Left(NetworkFailure());
  }

  @override
  Future<Either<Failure, Todo>> getTask(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final TodoModel remoteTask = await remoteDatasource.getTask(id);
        localDatasource.cacheTask(remoteTask);
        return Right(remoteTask);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final task = await localDatasource.getTask();
        return Right(task);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, Todo>> createTask(Todo task) async{
    if (await networkInfo.isConnected) {
      try {
        final TodoModel response = await remoteDatasource.createTask(task as TodoModel);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Left(NetworkFailure());
  }
  
  @override
  Future<Either<Failure, Todo>> deleteTask(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final TodoModel response = await remoteDatasource.deleteTask(id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Left(NetworkFailure());
  }
  
  @override
  Future<Either<Failure, Todo>> markTask(Todo task) async {
    if (await networkInfo.isConnected) {
      try {
        final TodoModel response = await remoteDatasource.markTask(task as TodoModel);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Left(NetworkFailure());
  }
  
  @override
  Future<Either<Failure, Todo>> updateTask({required String id, String? name, String? description, DateTime? dueDate}) async {
    if (await networkInfo.isConnected) {
      try {
        final TodoModel response = await remoteDatasource.updateTask(id:id, name: name, description: description, dueDate: dueDate);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Left(NetworkFailure());
  }
}
