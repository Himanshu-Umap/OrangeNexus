// File: lib/screens/home/farmer_home.dart
import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:uuid/uuid.dart'; // Add this dependency to pubspec.yaml

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  final List<Product> _productList = [];
  final String _farmerId = 'current_farmer_id'; // Replace with actual farmer ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWelcomeCard(),
          const SizedBox(height: 16),
          _buildUploadButton(context),
          const SizedBox(height: 16),
          _buildProductList(),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, John Doe!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('You have ${_productList.length} active listings.'),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final result = await Navigator.pushNamed(context, '/product_upload');
        if (result != null && result is Product) {
          setState(() {
            _productList.add(result);
          });
        }
      },
      icon: const Icon(Icons.add),
      label: const Text('Upload New Produce'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  Widget _buildProductList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Produce',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (_productList.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('No produce listed yet'),
            ),
          )
        else
          ..._productList.map((product) => Card(
                child: ListTile(
                  leading: const Icon(Icons.agriculture),
                  title: Text(product.name),
                  subtitle: Text(
                      '${product.quantity}kg - ₹${product.price.toStringAsFixed(2)}'),
                  trailing: Chip(label: Text(product.status)),
                ),
              )),
      ],
    );
  }
}