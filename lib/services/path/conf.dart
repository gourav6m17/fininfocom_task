import 'dart:io';

import '../../models/bluetooth_models.dart';
import '../bluetooth/bluetooth_manager_android.dart';
import '../bluetooth/bluetooth_manager_ios.dart';

class BluetoothManagerPath {
  final bmAndroid = BluetoothManagerAndroid();
  final bmIOS = BluetoothManagerIOS();

  Future<ActionResponse> enable() async {
    try {
      if (Platform.isAndroid) {
        return await bmAndroid.enable();
      } else if (Platform.isIOS) {
        return await bmIOS.enable();
      } else {
        throw '[enable_bluetooth] platform_not_supported - only Android and iOS are supported';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ActionResponse> disable() async {
    try {
      if (Platform.isAndroid) {
        return await bmAndroid.disable();
      } else if (Platform.isIOS) {
        return await bmIOS.disable();
      } else {
        throw '[disable_bluetooth] platform_not_supported - only Android and iOS are supported';
      }
    } catch (e) {
      rethrow;
    }
  }
}
