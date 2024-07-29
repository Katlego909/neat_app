import 'package:flutter/material.dart';
import 'package:neat_test_app/providers/booking_provider.dart';
import 'package:provider/provider.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Bookings'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Stack(
                children: [
                  Icon(Icons.home),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BookingList(status: 'Pending'),
            BookingList(status: 'Completed'),
            BookingList(status: 'Cancelled'),
          ],
        ),
      ),
    );
  }
}

class BookingList extends StatelessWidget {
  final String status;

  const BookingList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bookings = context
        .watch<BookingProvider>()
        .bookings
        .where((booking) => booking.status == status)
        .toList();

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
                '${booking.service} - R${booking.price.toStringAsFixed(2)}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${booking.date}'),
                Text('Time: ${booking.time}'),
                Text('Service: ${booking.service}'),
                Text('Address: ${booking.address}'),
                Text('Notes: ${booking.userNotes}'),
                if (booking.latitude != null && booking.longitude != null)
                  Text('Location: (${booking.latitude}, ${booking.longitude})'),
              ],
            ),
            trailing: status == 'Pending'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Implement edit functionality
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          context.read<BookingProvider>().cancelBooking(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<BookingProvider>().deleteBooking(index);
                        },
                      ),
                    ],
                  )
                : null,
          ),
        );
      },
    );
  }
}
