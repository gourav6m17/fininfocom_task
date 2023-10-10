import 'package:fininfocom_task/services/bluetooth/bluetooth_manager.dart';
import 'package:fininfocom_task/views/bluetooth/bluetooth_screen.dart';
import 'package:fininfocom_task/views/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/mybutton.dart';
import '../random_image/random_image_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/firstpage";

  HomeScreen({super.key});

  BluetoothManager manager = BluetoothManager();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              iconData: Icons.animation,
              buttonText: 'Random Dog Image',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RandomImage()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              iconData: Icons.bluetooth,
              buttonText: 'Enable Bluetooth',
              onTap: () async {
                await manager.enableBluetooth().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BluetoothScreen())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              iconData: Icons.handyman,
              buttonText: 'Profile',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                // Navigator.popAndPushNamed(context, Profile.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
