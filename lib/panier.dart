import 'package:ecomerce/articles.dart';
import 'package:flutter/material.dart';

class Panier extends StatefulWidget {
  const Panier({super.key});
  static List<Article> panier = [];
  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
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
                  for (var article in Panier.panier)
                    ListTile(
                      leading: Image.network(
                        article.image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(article.title),
                      subtitle: Text("${article.price} €"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            Panier.panier.remove(article);
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ${Panier.panier.fold(0.0, (previousValue, element) => previousValue + element.price).toStringAsFixed(2)} €"),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Commande passée")));
                    setState(() {
                      Panier.panier.clear();
                    });
                  },
                  child: const Text("Commander"),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  Panier.panier.clear();
                });
              },
              child: const Text("Vider le panier"),
            ),
            
          ],
        ),
      ),
    );
  }
}