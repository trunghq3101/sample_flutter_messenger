import 'package:flutter_driver/flutter_driver.dart';
import 'package:sample_flutter_messenger/keys.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('Testing navigation', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('Open New chats screen', () async {
      final newChatBtn = find.byValueKey(Keys.NEW_ACTION_BTN);
      await driver.waitFor(newChatBtn);
      await delay();
      await driver.tap(newChatBtn);
      await delay();
    });
  });
}
