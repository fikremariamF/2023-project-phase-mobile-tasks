enum Status { completed, pending }

class Task {
  String title;
  String description;
  DateTime dueDate;
  Status status;

  Task(
      {required this.title,
      required this.description,
      required this.dueDate,
      this.status = Status.pending});

  @override
  String toString() {
    return 'Title: $title, Description: $description, Due date: $dueDate, Status: ${status.toString().split('.').last}';
  }
}
