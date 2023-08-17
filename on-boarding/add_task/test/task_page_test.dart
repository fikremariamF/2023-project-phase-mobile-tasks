import 'package:add_task/features/todo/domain/entities/task.dart';
import 'package:add_task/features/todo/presentation/pages/Task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mockTask = Todo(
    id: "98234-234-234",
    name: 'Test Task',
    description: 'This is a test task description',
    dueDate: DateTime(2023, 1, 1),
  );

  testWidgets('TaskDetailPage displays task details correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TaskDetailPage(task: mockTask)));

    expect(find.text('Task Detail'), findsOneWidget);

    expect(find.text('Test Task'), findsOneWidget);

    expect(find.text('This is a test task description'), findsOneWidget);

    expect(find.text('Jan 01,2023'), findsOneWidget);
  });
}
