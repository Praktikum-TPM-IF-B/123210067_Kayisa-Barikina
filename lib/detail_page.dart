import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profil Anda'),
        ),
      ),
    );
  }
}
