import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;

  void initializeVideoPlayer(String filePath) async {
    _vCont = await VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false)
      ..initialize().then((_) async {
        await loadConfigs();
        notifyListeners();
      });
  }

  void setPlayPause(bool isPlay) {
    if (_vCont != null) {
      !isPlay ? _vCont!.pause() : _vCont!.play();
    }
    notifyListeners();
  }

  Future<void> loadConfigs() async {
    try {
      var _configBox = await Hive.openBox<int>('vidConfigs');
      if (_vCont != null) {
        // leer los miliseconds de Hive
        int millis = _configBox.get('video_time') ?? 0; // de Hive
        Duration position = Duration(microseconds: (millis * 1000).toInt());
        await _vCont!.setVolume(1.0);
        await _vCont!.seekTo(position);
        notifyListeners();
        print("configs cargadas..");
      }
    } catch (e) {
      print("Error al load: ${e.toString()}");
      // _vCont!.seekTo(Duration.zero);
      notifyListeners();
    }
  }

  Future saveConfigs() async {
    try {
      var box = await Hive.openBox<int>('vidConfigs');
      if (_vCont != null) {
        Duration position = _vCont!.value.position;
        // guardar los miliseconds en hive
        await box.put("video_time", position.inMilliseconds);
        isSaved = true;
        notifyListeners();
        print("configs guardadas..");
      }
    } catch (e) {
      isSaved = false;
      print("Error al guardar: ${e.toString()}");
      notifyListeners();
    }
  }
}
