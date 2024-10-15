// File: lib/screens/profile/farmer_profile.dart

import 'package:flutter/material.dart';

class FarmerProfilePage extends StatelessWidget {
  const FarmerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/farmer_avatar.png'),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Alice Smith',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoCard('Location', 'Gujarat, India'),
            _buildInfoCard('Farming Experience', '15 years'),
            _buildInfoCard('Specialties', 'Organic Fruits, Vegetables'),
            _buildInfoCard('Total Sales', '₹50,000'),
            const SizedBox(height: 24),
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildTransactionCard('Oranges', '10kg', '₹500', 'Completed'),
            _buildTransactionCard('Apples', '15kg', '₹750', 'Pending'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(String product, String quantity, String price, String status) {
    return Card(
      child: ListTile(
        title: Text(product),
        subtitle: Text('$quantity - $price'),
        trailing: Chip(
          label: Text(status),
          backgroundColor: status == 'Completed' ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
