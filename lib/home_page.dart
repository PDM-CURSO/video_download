import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downlad/providers/my_download_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an option'),
      ),
      body: Consumer<MyDownloadProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            Expanded(child: Center(child: _showLoading(provider))),
            MaterialButton(
              child: Text("Descargar"),
              onPressed: provider.isSavedSuccess != null
                  ? null
                  : () {
                      provider.descargarVideo();
                    },
            ),
            MaterialButton(child: Text("Ver video"), onPressed: () {}),
            MaterialButton(child: Text("Borrar video"), onPressed: () {}),
            _showVideoPath(provider),
          ],
        );
      }),
    );
  }

  // estados del widget descargando...
  Widget _showLoading(MyDownloadProvider provider) {
    if (provider.isLoading) {
      return CircularProgressIndicator();
    } else {
      return Container();
    }
  }

  // estados del texto que muestra el path
  Widget _showVideoPath(MyDownloadProvider provider) {
    if (provider.videoPath != null) {
      return Text("El video esta guardado en:\n${provider.videoPath}");
    } else {
      if (provider.isSavedSuccess != null && provider.isSavedSuccess != false) {
        return Text("El video esta guardado en:\n${provider.videoPath}");
      } else if (provider.isSavedSuccess != null && !provider.isSavedSuccess!) {
        return Text("Ha ocurrido un error al descargar...");
      } else {
        return Container();
      }
    }
  }
}
