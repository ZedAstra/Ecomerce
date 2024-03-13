import 'dart:convert';
import 'dart:io';

import 'package:ecomerce/panier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: fetchItems(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(child: Text("Erreur: ${snapshot.error}"));
        }
        if (snapshot.hasData) {
          return MasonryGridView.count(crossAxisCount: 2, itemBuilder: (context, index) {
            if(index < snapshot.data!.length) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Panier.panier.add(snapshot.data![index]);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${snapshot.data![index].title} ajouté au panier")));
                  },
                  child: Column(
                    children: [
                      Image.network(snapshot.data![index].image),
                      Text(snapshot.data![index].title),
                      Text(snapshot.data![index].price.toString()),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }, itemCount: snapshot.data!.length,);
        }
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}

// https://fakestoreapi.com
Future<List<Article>> fetchItems() async {
  HttpClientRequest request = await HttpClient().getUrl(Uri.parse("https://fakestoreapi.com/products"));
  HttpClientResponse response = await request.close();
  String json = await response.transform(utf8.decoder).join();
  List<Article> items = [];
  for (var item in jsonDecode(json)) {
    items.add(Article.fromJson(item));
  }
  print(items.length);
  return items;
}

class Article {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  Article({required this.id, required this.title, required this.description, required this.price, required this.category, required this.image});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price:  double.parse(json['price'].toString()),
      category: json['category'],
      image: json['image'],
    );
  }
}