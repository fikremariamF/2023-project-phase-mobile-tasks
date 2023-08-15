class Task {
  String name;
  DateTime dueDate;
  String description;
  bool done= false;

  Task({
    required this.name,
    required this.dueDate,
    required this.description,
  });
}