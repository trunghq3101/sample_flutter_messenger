import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter_messenger/main.dart';
import 'package:sample_flutter_messenger/routes/home_route.dart';

void main() {
  group('MyApp', () {
    testWidgets('When app shows up, it shows home route',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byType(HomeRoute), findsOneWidget);
    });
  });
}
