import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:add_task/main.dart';

void main() {
  testWidgets('MyHomePage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Image), findsOneWidget); // verifty the image asset is loaded

    expect(find.text('Get Started'), findsOneWidget); // Verfiy the text on the button

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final ButtonStyle? buttonStyle = button.style;
    final backgroundColor =
        buttonStyle?.backgroundColor?.resolve({MaterialState.selected});
    expect(backgroundColor, equals(Colors.blue)); //Verify the button's background color is blue
  });
}
