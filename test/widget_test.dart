import 'package:flutter_test/flutter_test.dart';
import 'package:calcconvert/main.dart';

void main() {
  testWidgets('renders the main converter screen', (tester) async {
    await tester.pumpWidget(const CalcConvertApp());

    expect(find.text('CalcConvert'), findsOneWidget);
    expect(find.text('Fast and clean conversions'), findsOneWidget);
  });
}
