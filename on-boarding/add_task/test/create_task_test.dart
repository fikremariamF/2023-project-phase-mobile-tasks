import 'package:add_task/presentation/create_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CreateTaskPage UI and functionality test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CreateTaskPage()));

    expect(find.text('Main Task Name'), findsOneWidget);

    final taskNameField = find.byType(TextFormField).at(0);
    expect(taskNameField, findsOneWidget);

    expect(find.text('Due Date'), findsOneWidget);

    final dateField = find.byType(TextFormField).at(1);
    expect(dateField, findsOneWidget);

    expect(find.text('Description'), findsOneWidget);

    final descriptionField = find.byType(TextFormField).at(2);
    expect(descriptionField, findsOneWidget);

    final addButton = find.widgetWithText(ElevatedButton, 'Add Task');
    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pump();

    expect(find.text('Task name can not be empty'), findsOneWidget);
    expect(find.text('Due-Date can not be empty'), findsOneWidget);
    expect(find.text('Description can not be empty'), findsOneWidget);
  });
}
