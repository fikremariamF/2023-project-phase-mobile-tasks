import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/presentation/bloc/todo_app_event.dart';
import 'package:add_task/features/todo/presentation/bloc/todo_app_state.dart';

import '../../domain/usecases/delete_task.dart';

List<Todo> tasks = [];

class TaskManagerBloc extends Bloc<TaskEvent, TaskState> {
  TaskManagerBloc() : super(TaskInitial()) {
    final GetTasks getTasks = sl();
    final GetTask getTask = sl();

    final DeleteTask deleteTask = sl();
    final UpdateTask updateTask = sl();
    final MarkTask markTask = sl();
    final CreateTask createTask = sl();

    on<TaskEvent>((event, emit) async {
      if (event is TasksRequested) {
        emit(Loading());
        final response = await getTasks.getTasks();

        response.fold(
            (failure) => emit(const Error(message: "Error getting tasks")),
            (tasks) => emit(LoadedTasks(tasks: tasks)));
      } else if (event is TaskRequested) {
        emit(Loading());
        final response = await getTask.call(event.task.id);
        response.fold(
            (failure) => emit(const Error(message: "Error getting task")),
            (task) => emit(TaskDetail(task: task)));
      } else if (event is TaskAdded) {
        emit(Loading());
        final task = await createTask.call(event.task);
        if (task.isRight()) {
          final response = await getTasks.call();
          response.fold(
              (failure) => emit(const Error(message: "Error creating task")),
              (tasks) => emit(LoadedTasks(tasks: tasks)));
        }
      } else if (event is TaskDeleted) {
        emit(Loading());
        final task = await deleteTask.call(event.task.id);
        if (task.isRight()) {
          final response = await getTasks.call();
          response.fold(
              (failure) => emit(const Error(message: "Error deleting task")),
              (tasks) => emit(LoadedTasks(tasks: tasks)));
        }
      } else if (event is TaskMarked) {
        await markTask.call(event.task);
      } else if (event is TaskUpdated) {
        emit(Loading());
        final task = await updateTask.call(
            id: event.id,
            title: event.title,
            description: event.description,
            newDeadline: event.deadline);

        if (task.isRight()) {
          final response = await getTasks.call();
          response.fold(
              (failure) => emit(const Error(message: "Error updating task")),
              (tasks) => emit(LoadedTasks(tasks: tasks)));
        } else {
          emit(const Error(message: "Error updating task"));
        }
      } else if (event is TaskRequested) {
        emit(Loading());
        final response = await getTask.call(event.task.id);
        response.fold(
            (failure) => emit(const Error(message: "Error getting task")),
            (task) => emit(TaskDetail(task: task)));
      } else {
        emit(EmptyTasks());
      }
    });
  }
}

