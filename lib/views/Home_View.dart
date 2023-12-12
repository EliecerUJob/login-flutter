// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
          child: Text(
        "Hola homeview",
        style: TextStyle(fontSize: 45),
      )),
    );
  }
}
