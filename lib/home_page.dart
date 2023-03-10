import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an option'),
      ),
      body: Column(
        children: [
          MaterialButton(child: Text("Ver video"), onPressed: () {}),
          MaterialButton(child: Text("Borrar video"), onPressed: () {}),
        ],
      ),
    );
  }

  // TODO: estados del widget descargando...

  // TODO: estados del texto que muestra el path
}
