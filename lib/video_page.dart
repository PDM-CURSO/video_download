import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downlad/providers/my_video_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: Consumer<MyVideoProvider>(
        builder: (context, provider, _) {
          if (provider.getVidCont == null) {
            return Center(child: CircularProgressIndicator());
          } else
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: provider.getVidCont!.value.aspectRatio,
                  child: VideoPlayer(provider.getVidCont!),
                ),
                Text(
                  "${provider.getVidCont!.value.position}/${provider.getVidCont!.value.duration}",
                ),
                VideoProgressIndicator(
                  provider.getVidCont!,
                  allowScrubbing: true,
                ),
                ElevatedButton.icon(
                  icon: Icon(provider.getVidCont!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                  label: Text(
                    provider.getVidCont!.value.isPlaying ? "Pause" : "Play",
                  ),
                  onPressed: () {
                    if (provider.getVidCont!.value.isPlaying) {
                      provider.setPlayPause(false);
                    } else {
                      provider.setPlayPause(true);
                    }
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("Guardar"),
                  onPressed: () async {
                    await provider.saveConfigs();
                    if (provider.isSaved) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Guardado..."),
                        ),
                      );
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Seek to"),
                  onPressed: () {
                    provider.loadConfigs();
                  },
                ),
              ],
            );
        },
      ),
    );
  }
}
