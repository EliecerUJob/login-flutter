// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'widgets/form_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Iniciar sesión",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: FormWidget(),
            )
          ],
        ),
      ),
    );
  }
}
