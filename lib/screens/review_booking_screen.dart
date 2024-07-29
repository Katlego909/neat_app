import 'package:flutter/material.dart';
import 'package:neat_test_app/models/booking_model.dart';
import 'package:neat_test_app/screens/payment_options_screen.dart';

class ReviewBookingScreen extends StatelessWidget {
  final Booking booking;

  const ReviewBookingScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: ${booking.service}'),
            Text('Price: R${booking.price.toStringAsFixed(2)}'),
            Text('Date: ${booking.date}'),
            Text('Time: ${booking.time}'),
            Text('Address: ${booking.address}'),
            Text('Notes: ${booking.userNotes}'),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentOptionScreen(booking: booking),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff007ba7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Proceed to Payment",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
