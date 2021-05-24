import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String? item;

  const ProductDetailPage({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: Center(
        child: Text(item ?? "Item not found"),
      ),
    );
  }
}
