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

    test('Open New action screen', () async {
      final newChatBtn = find.byValueKey(Keys.NEW_ACTION_BTN);
      final backBtn = find.byValueKey(Keys.BACK_BTN);
      await driver.waitFor(newChatBtn);
      await delay();
      await driver.tap(newChatBtn);
      await delay();
      await driver.tap(backBtn);
      await delay();
    });

    test('Open New action screen and change between tabs', () async {
      final newChatBtn = find.byValueKey(Keys.NEW_ACTION_BTN);
      await driver.waitFor(newChatBtn);
      await delay();
      await driver.tap(newChatBtn);
      await delay();
      await driver.tap(find.byValueKey(Keys.TAB_ENCRYPTED));
      await delay();
      await driver.tap(find.byValueKey(Keys.TAB_CHANNEL));
      await delay();
      await driver.tap(find.byValueKey(Keys.TAB_CALL));
      await delay();
      await driver.tap(find.byValueKey(Keys.TAB_CONTACT));
      await delay();
      await driver.tap(find.byValueKey(Keys.TAB_CHATS));
      await delay();
    });
  });
}
