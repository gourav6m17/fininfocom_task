import '../../../models/bluetooth_models.dart';
import 'package:flutter/services.dart';

class BluetoothManagerAndroid {
  static const MethodChannel _channel =
      MethodChannel('gourav.com/bluetooth_manager');

  Future<ActionResponse> enable() async {
    try {
      return enumFromString(ActionResponse.values,
          await _channel.invokeMethod('enableBluetooth'));
    } catch (e) {
      rethrow;
    }
  }

  Future<ActionResponse> disable() async {
    try {
      return enumFromString(ActionResponse.values,
          await _channel.invokeMethod('disableBluetooth'));
    } catch (e) {
      rethrow;
    }
  }
}
