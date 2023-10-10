import 'package:fininfocom_task/views/random_image/random_image_screen.dart';
import 'package:flutter/material.dart';

import 'views/bluetooth/bluetooth_screen.dart';
import 'views/home/home_screen.dart';
import 'views/profile/profile.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  BluetoothScreen.routeName: (context) => BluetoothScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  RandomImage.routeName: (context) => RandomImage(),
};
