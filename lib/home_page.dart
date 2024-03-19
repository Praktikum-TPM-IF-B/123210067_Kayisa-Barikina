import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hi, Nama Mahasiswa'),
        ),
        // ElevatedButton(
        //   onPressed:(),
        //   child: Text("Profil"),
        // ),
        body: ListView.builder(itemBuilder: (context, teman) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Teman $teman',
                style: TextStyle(fontSize: 30),
              ),
            ),
          );
        }),
      ),
    );
  }
}
