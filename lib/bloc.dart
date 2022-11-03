import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bloc {
  var methodChannel = const MethodChannel("com.example.location_service_best");

  Bloc();

  void startServiceInPlatform() async {
    initializeAndroidWidgets();
    // if (Platform.isAndroid) {
    //   String data = await methodChannel.invokeMethod("startService");
    //   debugPrint(data);
    // }
  }

  Future<void> stopService() async {
    if (Platform.isAndroid) {
      String data = await methodChannel.invokeMethod("stopService");
      debugPrint(data);
    }
  }
}

void initializeAndroidWidgets() {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();

    const MethodChannel channel = MethodChannel('com.example.location_service_best');

    // CallbackHandle? callback =
    //     PluginUtilities.getCallbackHandle(onWidgetUpdate);
    // final handle = callback?.toRawHandle();

    channel.invokeMethod('startService');
  }
}

void onWidgetUpdate() {
  // Initialize flutter
  WidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('com.example.location_service_best');

  channel.setMethodCallHandler(
    (call) async {
      final id = call.arguments;

      print('on Dart ${call.method}!');

      // Do your stuff here...
      // final result = Random().nextDouble();

      return {
        // Pass back the id of the widget so we can
        // update it later
        'id': id,
        // Some data
        // 'value': result,
      };
    },
  );
}
