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
    // TODO 1: hacer el metodo para descargar video
  }

  Future<bool> _requestStoragePermission() async {
    // TODO 2: hacer el metodo para solicitar acceso al almacenamiento
    return false;
  }

  Future<void> _saveFile(Uint8List _content) async {
    // TODO 3: revisar si tenemos permiso

    // TODO 4: acceso al storage revisar plataformas y almacenamientos

    // TODO 5: escribir archivo en almacenamiento
  }
}
