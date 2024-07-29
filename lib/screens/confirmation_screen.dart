import 'package:flutter/material.dart';
import 'package:neat_test_app/screens/my_bookings_screen.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfc3b4),
      appBar: AppBar(
        title: Text(
          "Booking Successful",
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 160,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Booking Complete",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your service has been booked successfully",
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyBookingsPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Download Invoice".toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyBookingsPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff007ba7),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Center(
                      child: Text("View Bookings".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
