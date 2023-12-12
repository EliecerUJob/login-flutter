import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "data",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Iniciar sesión",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(),
                  TextFormField(),
                  ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(200, 50))),
                      onPressed: () {},
                      child: const Text("Ingresar"))
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
