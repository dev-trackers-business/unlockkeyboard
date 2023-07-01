import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unlockkeyguard/unlockkeyguard_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelUnlockkeyguard platform = MethodChannelUnlockkeyguard();
  const MethodChannel channel = MethodChannel('unlockkeyguard');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
