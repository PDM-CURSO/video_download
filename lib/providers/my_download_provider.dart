import 'dart:async';
import 'package:flutter/foundation.dart';

class MyDownloadProvider with ChangeNotifier {
  bool isPermissionGranted = false;
  bool? isSavedSuccess;
  bool isLoading = false;
  String videoName = "butterfly";
  String? videoPath;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  Future<void> descargarVideo() async {
    // TODO: hacer el metodo para descargar video
  }

  Future<bool> _requestStoragePermission() async {
    // TODO: hacer el metodo para solicitar acceso al almacenamiento
    return false;
  }

  Future<void> _saveFile(Uint8List _content) async {
    // TODO: revisar si tenemos permiso

    // TODO: acceso al storage revisar plataformas y almacenamientos

    // TODO: escribir archivo en almacenamiento
  }
}
