import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class MyDownloadProvider with ChangeNotifier {
  bool isPermissionGranted = false;
  bool? isSavedSuccess;
  bool isLoading = false;
  String videoName = "butterfly";
  String? videoPath;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  Future<void> descargarVideo() async {
    // hacer el metodo para descargar video
    try {
      isLoading = true;
      notifyListeners();
      var res = await get(Uri.parse(videoUrl));
      if (res.statusCode == 200) {
        await _saveFile(res.bodyBytes);
      }
    } catch (e) {
      print("Error al descargar: $e");
      isSavedSuccess = false;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> _requestStoragePermission() async {
    var permiso = await Permission.storage.status;
    if (permiso == PermissionStatus.denied) {
      await Permission.storage.request();
    }
    return permiso == PermissionStatus.granted;
  }

  Future<void> _saveFile(Uint8List _content) async {
    // revisar si tenemos permiso
    if (!await _requestStoragePermission()) {
      isPermissionGranted = false;
      isLoading = false;
      notifyListeners();
      return;
    }

    // acceso al storage solo android
    var dir = await getExternalStorageDirectory();
    // crear y escribir archivo
    videoPath = "${dir!.path}/$videoName.mp4";
    File file = File(videoPath!);
    await file.writeAsBytes(_content);
    isSavedSuccess = true;
    isLoading = false;
    notifyListeners();
  }
}
