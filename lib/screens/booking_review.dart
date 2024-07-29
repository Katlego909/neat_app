import 'package:flutter/material.dart';
import 'package:neat_test_app/models/booking_model.dart';
import 'payment_screen.dart';

class BookingReview extends StatelessWidget {
  final Booking booking;

  const BookingReview({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: ${booking.service}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Price: R${booking.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Date: ${booking.date}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Time: ${booking.time}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            if (booking.latitude != null && booking.longitude != null)
              Text('Location: (${booking.latitude}, ${booking.longitude})',
                  style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Location: ', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Notes: ${booking.userNotes}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(booking: booking),
                  ),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
