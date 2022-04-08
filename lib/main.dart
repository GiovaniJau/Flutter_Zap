import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_zap/screens/HomePage.dart';
import 'package:get/get.dart';

void main() async{
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
      GetMaterialApp(
        title: 'Flutter Zap',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(camera: firstCamera),
      ));
}
