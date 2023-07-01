import 'package:flutter_test/flutter_test.dart';
import 'package:unlockkeyguard/unlockkeyguard.dart';
import 'package:unlockkeyguard/unlockkeyguard_platform_interface.dart';
import 'package:unlockkeyguard/unlockkeyguard_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUnlockkeyguardPlatform
    with MockPlatformInterfaceMixin
    implements UnlockkeyguardPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UnlockkeyguardPlatform initialPlatform = UnlockkeyguardPlatform.instance;

  test('$MethodChannelUnlockkeyguard is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUnlockkeyguard>());
  });

  test('getPlatformVersion', () async {
    Unlockkeyguard unlockkeyguardPlugin = Unlockkeyguard();
    MockUnlockkeyguardPlatform fakePlatform = MockUnlockkeyguardPlatform();
    UnlockkeyguardPlatform.instance = fakePlatform;

    expect(await unlockkeyguardPlugin.getPlatformVersion(), '42');
  });
}
