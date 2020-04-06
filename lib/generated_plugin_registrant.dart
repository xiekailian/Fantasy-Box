//
// Generated file. Do not edit.
//
import 'dart:ui';

import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(PluginRegistry registry) {
  FlutterWebImagePicker.registerWith(registry.registrarFor(FlutterWebImagePicker));
  SharedPreferencesPlugin.registerWith(registry.registrarFor(SharedPreferencesPlugin));
  registry.registerMessageHandler();
}
