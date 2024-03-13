import 'package:flutter/material.dart';

import 'acceuil.dart';

class Authentification extends StatefulWidget {
  // If this is the login or register page
  ValueNotifier<bool> isLogin = ValueNotifier(true);
  Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}


class _AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(valueListenable: widget.isLogin, builder: (context, value, child) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Mot de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Acceuil()));
                          },
                          child: Text(widget.isLogin.value ? "Se connecter" : "S'inscrire"),
                        ),
                        SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {
                            widget.isLogin.value = !widget.isLogin.value;
                          },
                          child: Text(widget.isLogin.value ?  "S'inscrire" : "Se connecter"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}