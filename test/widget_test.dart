import 'package:flutter_test/flutter_test.dart';
import 'package:lab1_mobile_n2/app.dart';

void main() {
  testWidgets('Jobspot app launches splash', (tester) async {
    await tester.pumpWidget(const JobspotApp());
    expect(find.text('Jobspot'), findsOneWidget);
  });
}
