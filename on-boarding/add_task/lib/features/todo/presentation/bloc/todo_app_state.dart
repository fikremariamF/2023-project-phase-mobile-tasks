import 'package:equatable/equatable.dart';

import '../../domain/entities/task.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

class EmptyTasks extends TaskState {}

class LoadedTasks extends TaskState {
  final List<Todo> tasks;
  const LoadedTasks({required this.tasks});
}

class TaskDetail extends TaskState {
  final Todo task;
  const TaskDetail({required this.task});
}

class Error extends TaskState {
  final String message;
  const Error({required this.message});
}

class Loading extends TaskState {}
