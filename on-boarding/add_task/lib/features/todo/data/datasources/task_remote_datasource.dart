import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/task.dart';
import '../model/task_model.dart';

abstract class TaskRemoteDatasource {
  Future<List<TodoModel>> getTasks();
  Future<TodoModel> getTask(String id);
  Future<TodoModel> createTask(TodoModel task);
  Future<TodoModel> markTask(TodoModel task);
  Future<TodoModel> updateTask(
      {required String id,
      String? name,
      String? description,
      DateTime? dueDate});
  Future<TodoModel> deleteTask(String id);
}

class TaskRemoteDataSourceImpl extends TaskRemoteDatasource {
  final http.Client client;

  TaskRemoteDataSourceImpl({required this.client});
  @override
  Future<TodoModel> createTask(TodoModel task) async {
    final response = await client.post(
      "http://todo-app.com/create-task" as Uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> deleteTask(String id) async {
    final response = await client.delete(
      'http://todo-app.com/$id' as Uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> getTask(String id) async {
    final response = await client.get(
      'http://todo-app.com/$id' as Uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoModel>> getTasks() async {
    final response = await client.get(
      'http://todo-app.com' as Uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonTodos = json.decode(response.body);
      final todos =
          jsonTodos.map((item) => TodoModel.fromJson(json.decode(item)));
      return todos;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> markTask(TodoModel task)async {
    final response = await client.put(
      "http://todo-app.com/update-task" as Uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> updateTask(
      {required String id,
      String? name,
      String? description,
      DateTime? dueDate}) async {
    final response = await client.put(
      "http://todo-app.com/update-task" as Uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"id":id, "name":name, "description": description, "dueDate": dueDate}),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
