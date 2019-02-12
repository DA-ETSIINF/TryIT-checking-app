import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:tryit_checkin/screens/camera_screen.dart';

class Routes {
  static String root = "/";
  static String camera= "/camera";


  void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return Scaffold(appBar: AppBar(), body: Text("Cant find it"));
        });
    router.define(camera, handler: cameraHandler);



  }
}

class Application {
  static Router router;
}




var cameraHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CameraScreen();
});