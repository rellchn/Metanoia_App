import 'package:flutter_test/flutter_test.dart';
import 'package:metanoia/main.dart';

void main() {
  testWidgets('Welcome screen tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const MetanoiaApp());

    expect(find.text('Masuk Sebagai Petugas'), findsOneWidget);
    expect(find.text('Masuk Sebagai Warga'), findsOneWidget);
  });
}
