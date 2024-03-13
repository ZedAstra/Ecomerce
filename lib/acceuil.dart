import 'package:ecomerce/articles.dart';
import 'package:ecomerce/panier.dart';
import 'package:ecomerce/parametres.dart';
import 'package:ecomerce/promotions.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  Acceuil({super.key});
  int _selectedIndex = 1;

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: <Widget>[
          const Promotions(),
          const Articles(),
          const Panier(),
        ][widget._selectedIndex],
        endDrawer: const Drawer(
          child: Parametres(),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: widget._selectedIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.local_offer), label: "Promotions"),
            NavigationDestination(icon: Icon(Icons.home), label: "Acceuil"),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Panier"),
          ],
          onDestinationSelected: (value) {
            setState(() {
              widget._selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}