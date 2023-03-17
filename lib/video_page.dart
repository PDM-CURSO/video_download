import 'dart:io';

import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
                // TODO: agregar el Video player (quita el container)
                ),
          ),
          Text(
            "00:00 / 99:99",
          ),
          // TODO: Agregar Video Player indicator
          // TODO: agregar boton de play/pause
          ElevatedButton.icon(
            icon: Icon(Icons.save),
            label: Text("Guardar"),
            onPressed: () {
              // TODO: guardar el tiempo en que esta el video
            },
          ),
          MaterialButton(
            child: Text("Seek to"),
            onPressed: () {
              // TODO: mover a tiempo guardado
            },
          ),
        ],
      ),
    );
  }
}
