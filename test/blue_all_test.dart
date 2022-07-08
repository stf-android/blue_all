import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blue_all/blue_all.dart';

void main() {
  const MethodChannel channel = MethodChannel('blue_all');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BlueAll.platformVersion, '42');
  });
}
