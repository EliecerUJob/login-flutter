// ignore_for_file: file_names, use_build_context_synchronously, await_only_futures, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:jwtson/jwtson.dart';

import '../Home_View.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late String email, password;
  final _formKey = GlobalKey<FormState>();
  // final _jwt = Jwtson();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                email = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Este campo es obligatorio";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Este campo es obligatorio";
                }
                return null;
              },
              onSaved: (String? value) {
                password = value!;
              },
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(200, 50))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    UserCredential? credential = await login(email, password);

                    if (credential != null) {
                      if (credential.user != null) {
                        String token =
                            await credential.user!.getIdToken() as String;
                        print(token);
                        // if (credential.user!.emailVerified) { Validacion para verificacion de usario por correo

                        // final token = await _jwt

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                            (Route<dynamic> route) => false);
                        // }
                        //  else {}
                      }
                    }
                  }
                },
                child: const Text("Ingresar"))
          ],
        ));
  }

  Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {}
      if (e.code == 'wrong-password') {}
    }
    return null;
  }
}
