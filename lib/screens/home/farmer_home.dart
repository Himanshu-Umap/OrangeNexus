// File: lib/screens/home/farmer_home.dart

import 'package:flutter/material.dart';

class FarmerHomePage extends StatelessWidget {
  const FarmerHomePage({super.key});

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
          _buildProduceList(),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, John Doe!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('You have 3 active listings and 2 pending bids.'),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigate to upload page
        Navigator.pushNamed(context, '/product_upload');
      },
      icon: const Icon(Icons.add),
      label: const Text('Upload New Produce'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }

  Widget _buildProduceList() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Produce',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Icon(Icons.agriculture),
            title: Text('Oranges'),
            subtitle: Text('10kg - ₹500'),
            trailing: Chip(label: Text('2 bids')),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.agriculture),
            title: Text('Apples'),
            subtitle: Text('15kg - ₹750'),
            trailing: Chip(label: Text('Waiting')),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.agriculture),
            title: Text('Grapes'),
            subtitle: Text('5kg - ₹300'),
            trailing: Chip(label: Text('Sold')),
          ),
        ),
      ],
    );
  }
}