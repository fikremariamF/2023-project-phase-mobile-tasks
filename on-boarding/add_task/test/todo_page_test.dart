import 'package:add_task/features/todo/presentation/pages/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Create Task and return to TodoPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TodoPage()));

    expect(find.text('Todo'), findsOneWidget);
    await tester.tap(find.text('Create Task'));
    await tester.pumpAndSettle();


    expect(find.text('Create Task'), findsOneWidget);
  });
}
