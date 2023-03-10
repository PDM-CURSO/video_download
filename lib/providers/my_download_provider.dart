import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class MyDownloadProvider with ChangeNotifier {
  Future<void> descargarVideo() async {
    // TODO: hacer el metodo para descargar video
  }

  Future<bool> _requestStoragePermission() async {
    var permiso = await Permission.storage.status;
    if (permiso == PermissionStatus.denied) {
      await Permission.storage.request();
    }
    return permiso == PermissionStatus.granted;
  }

  Future<void> _saveFile(Uint8List _content) async {
    // TODO: revisar si tenemos permiso

    // acceso al storage solo android
    var dir = await getExternalStorageDirectory();
    // TODO: crear y escribir archivo
  }
}
