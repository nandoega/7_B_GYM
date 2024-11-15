import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2B5E),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C2B5E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Payment Method",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Our Official Bank Partners :",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 20),

            // Payment Logos
            _buildPaymentCard("assets/gopay.png"),
            SizedBox(height: 20),
            _buildPaymentCard("assets/visa.png"),
            SizedBox(height: 20),
            _buildPaymentCard("assets/bca.png"),
          ],
        ),
      ),
    );
  }

  // Helper method to build each payment card
  Widget _buildPaymentCard(String logoPath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          logoPath,
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
    );
  }
}
