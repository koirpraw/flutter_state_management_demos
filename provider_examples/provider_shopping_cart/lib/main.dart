import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_cart/provider/count_provider.dart';
import 'package:provider_shopping_cart/provider/item_provider.dart';

void main() {
  runApp(const ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(
          create: (_) => ItemCountProvider(),
        )
      ],
      child: CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider ShoppingCart App"),
      ),
      body: const Center(child: Text("Products Here")),
    );
  }
}
