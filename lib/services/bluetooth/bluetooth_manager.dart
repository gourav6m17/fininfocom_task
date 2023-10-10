import 'dart:async';

import '../../models/bluetooth_models.dart';
import '../path/conf.dart';

class BluetoothManager {
  final bluetoothManagerPath = BluetoothManagerPath();

  /// enable bluetooth
  ///
  /// and can return the bluetooth action response [ActionResponse]
  /// bluetoothIsOn, bluetoothIsOff, bluetoothAlreadyOn, bluetoothAlreadyOff, responseError
  Future<ActionResponse> enableBluetooth() async {
    try {
      return await bluetoothManagerPath.enable();
    } catch (e) {
      rethrow;
    }
  }

  /// disable bluetooth
  ///
  /// and can return the bluetooth action response [ActionResponse]
  /// bluetoothIsOn, bluetoothIsOff, bluetoothAlreadyOn, bluetoothAlreadyOff, responseError
  Future<ActionResponse> disableBluetooth() async {
    try {
      return await bluetoothManagerPath.disable();
    } catch (e) {
      rethrow;
    }
  }
}
