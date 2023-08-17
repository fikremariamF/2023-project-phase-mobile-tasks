import '../../domain/entities/task.dart';

// ignore: must_be_immutable
class TodoModel extends Todo{
  TodoModel({
    required String id,
    required String name,
    required DateTime dueDate,
    required String description,
    done = false
  }) : super(id: id, name: name, dueDate: dueDate, description: description, done: done);

  // final String id;
  // final String name;
  // final String description;
  // final DateTime dueDate;
  // final bool done;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        done: json["done"],
        dueDate: json["duedate"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "dueDate": dueDate,
      "done": done
    };
  }
}