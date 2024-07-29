import 'package:flutter/material.dart';
import 'package:neat_test_app/models/booking_model.dart';
import 'package:neat_test_app/screens/payment_screen.dart';

class PaymentOptionScreen extends StatelessWidget {
  final Booking booking;

  const PaymentOptionScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart button press
                },
              ),
              Positioned(
                right: 12,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Complete Booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please choose your preferred payment method',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Pay with cash',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('Cash'),
                      trailing: Radio(
                        value: 'cash',
                        groupValue: 'payment_method',
                        onChanged: (value) {
                          // Handle radio button selection
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Pay with card',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('Add Card'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentScreen(booking: booking),
                          ),
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Redeem your Coupon code',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.local_offer_outlined),
                      title: Text('Apply Coupon'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle apply coupon tap
                      },
                    ),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Handle place order button press
            //   },
            //   child: Text('PLACE ORDER'),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size(double.infinity, 50),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
