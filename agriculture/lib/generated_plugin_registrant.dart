//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

import 'package:agora_rtc_engine/agora_rtc_engine_web.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:geolocator_web/geolocator_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AgoraRtcEngineWeb.registerWith(registrar);
  FirebaseFirestoreWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseStorageWeb.registerWith(registrar);
  GeolocatorPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
