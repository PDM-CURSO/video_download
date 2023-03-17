import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;

  void initializeVideoPlayer(String filePath) async {
    // TODO: inicializar el video player
  }

  // TODO: cargar datos
  // TODO: guardar datos
}
