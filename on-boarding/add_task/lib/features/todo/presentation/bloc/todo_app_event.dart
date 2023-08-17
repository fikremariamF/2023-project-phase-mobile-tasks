import 'package:equatable/equatable.dart';

import '../../domain/entities/task.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskAdded extends TaskEvent {
  final Todo task;
  const TaskAdded({required this.task});
}

class TaskDeleted extends TaskEvent {
  final Todo task;
  const TaskDeleted({required this.task});
}

class TaskUpdated extends TaskEvent {
  final String id;
  final String? name;
  final String? description;
  final DateTime? dueDate;
  const TaskUpdated(
      {required this.id, this.name, this.description, this.dueDate});
}

class TaskRequested extends TaskEvent {
  final Todo task;
  const TaskRequested({required this.task});
}

class TasksRequested extends TaskEvent {}

class TaskMarked extends TaskEvent {
  final Todo task;
  const TaskMarked({required this.task});
}
