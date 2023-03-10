import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';

class MyDownloadProvider with ChangeNotifier {
  bool? isPermissionGranted; // mostrar al usurio snackbar
  bool? isSavedSuccess; // desactivar boton de descargar
  bool isLoading = false; // mostrar loading
  String _videoName = "butterfly";
  String? videoPath;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  Future<void> descargarVideo() async {
    try {
      isLoading = true;
      notifyListeners();
      _requestStoragePermission();
      var res = await get(Uri.parse(videoUrl));
      if (res.statusCode == 200) {
        await _saveFile(res.bodyBytes);
      }
    } catch (e) {
      isSavedSuccess = false;
      print("Error: $e");
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
      notifyListeners();
      return;
    }
    // solo android
    var dir = await getExternalStorageDirectory();
    // crear y escribir archivo
    videoPath = "${dir!.path}/$_videoName.mp4";
    final File file = File(videoPath!);
    await file.writeAsBytes(_content);
    isSavedSuccess = true;
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> fileExists() async {
    try {
      // solo android
      var dir = await getExternalStorageDirectory();
      videoPath = "${dir!.path}/$_videoName.mp4";
      File file = File(videoPath!);
      notifyListeners();
      return true;
    } catch (e) {
      videoPath = null;
      notifyListeners();
      return false;
    }
  }

  Future<void> removeVideo() async {}
}
