import 'package:flutter/material.dart';

import 'authentification.dart';

class Parametres extends StatefulWidget {
  const Parametres({super.key});

  @override
  State<Parametres> createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  // Profil, Nom + Avatar
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.person),
                    ),
                    title: Text("Nom"),
                  ),
                  const SettingsTile(title: "Profil", icon: Icons.person),
                  const SettingsTile(title: "Notifications", icon: Icons.notifications),
                  const SettingsTile(title: "Historique", icon: Icons.history),
                  const SettingsTile(title: "Paramètres", icon: Icons.settings),
                  SettingsTile(title: "Déconnexion", icon: Icons.logout,
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authentification()));
                    },),
                  const SettingsTile(title: "Aide", icon: Icons.help),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function? onTap;
  const SettingsTile({super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25)
          ),
          child: ListTileTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              onTap: () {
                if (onTap != null) {
                  onTap!();
                }
              },
            ),
          )
        ),
      ),
    );
  }
}