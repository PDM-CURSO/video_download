import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;

  void initializeVideoPlayer(String filePath) async {
    // inicializar el video player
    _vCont = await VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false)
      ..initialize().then((value) async {
        // TODO: cargar el progreso guardado del video
      });
  }

  void isPlayOrPause(bool isPlay) {
    if (isPlay) {
      _vCont!.pause();
    } else {
      _vCont!.play();
    }
    notifyListeners();
  }

  // TODO: cargar datos
  Future<void> loadConfigs() async {}

  // TODO: guardar datos
  Future saveConfigs() async {
    try {
      isSaved = true;
      notifyListeners();
    } catch (e) {
      print("Error al guardar: ${e.toString()}");
      isSaved = false;
      notifyListeners();
    }
  }
}
