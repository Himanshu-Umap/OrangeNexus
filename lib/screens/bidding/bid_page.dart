// File: lib/screens/bidding/bid_page.dart

import 'package:flutter/material.dart';

class BidPage extends StatefulWidget {
  final String productName;
  final String farmerName;
  final double basePrice;

  const BidPage({super.key, required this.productName, required this.farmerName, required this.basePrice});

  @override
  _BidPageState createState() => _BidPageState();
}

class _BidPageState extends State<BidPage> {
  late TextEditingController _bidController;
  late double _currentBid;

  @override
  void initState() {
    super.initState();
    _currentBid = widget.basePrice;
    _bidController = TextEditingController(text: _currentBid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place a Bid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Farmer: ${widget.farmerName}'),
            const SizedBox(height: 16),
            Text(
              'Current Highest Bid: ₹${_currentBid.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _bidController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Your Bid (₹)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Place Bid'),
              onPressed: () {
                // Implement bid placement logic
                double newBid = double.tryParse(_bidController.text) ?? 0;
                if (newBid > _currentBid) {
                  setState(() {
                    _currentBid = newBid;
                  });
                  // Send bid to server
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bid placed successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bid must be higher than current bid.')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}