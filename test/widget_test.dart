import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/main.dart';

void main() {
  testWidgets('Todo app loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());
    expect(find.text('To-Do App'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
