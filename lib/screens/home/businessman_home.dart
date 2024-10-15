// File: lib/screens/home/businessman_home.dart

import 'package:flutter/material.dart';

class BusinessmanHomePage extends StatelessWidget {
  const BusinessmanHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Businessman Dashboard'),
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
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildAvailableProduceList(),
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
              'Welcome, John Smith!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('You have 5 active bids and 2 completed transactions.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for produce...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildAvailableProduceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Produce',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.agriculture),
            title: const Text('Oranges'),
            subtitle: const Text('10kg - ₹500 • Farmer: Alice'),
            trailing: ElevatedButton(
              child: const Text('Bid'),
              onPressed: () {
                // Navigate to bidding page
                // Navigator.pushNamed(
                //   context,
                //   '/bid',
                //   arguments: 'Oranges', 
                // );
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.agriculture),
            title: const Text('Apples'),
            subtitle: const Text('15kg - ₹750 • Farmer: Bob'),
            trailing: ElevatedButton(
              child: const Text('Bid'),
              onPressed: () {
                // Navigate to bidding page
                // Navigator.pushNamed(
                //   context,
                //   '/bid',
                //   arguments: 'Oranges', 
                // );
              },
            ),
          ),
        ),
      ],
    );
  }
}