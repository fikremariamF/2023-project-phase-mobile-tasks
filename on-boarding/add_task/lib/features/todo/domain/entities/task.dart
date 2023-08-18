import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Todo extends Equatable {
  String id;
  String name;
  DateTime dueDate;
  String description;
  bool done;

  Todo({
    required this.id,
    required this.name,
    required this.dueDate,
    required this.description,
    this.done = false
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, dueDate, description, done];
}
