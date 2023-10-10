import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

class BluetoothScreen extends StatelessWidget {
  static String routeName = "/bluetooth";

  const BluetoothScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Center(
        child: Text(
          'Bluetooth',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
