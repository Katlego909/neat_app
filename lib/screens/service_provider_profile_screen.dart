import 'package:flutter/material.dart';
import 'package:neat_test_app/models/service_provider_model.dart';
import 'package:neat_test_app/screens/booking_form.dart';

class ServiceProviderProfile extends StatelessWidget {
  final ServiceProvider serviceProvider;

  const ServiceProviderProfile({super.key, required this.serviceProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfc3b4),
      appBar: AppBar(
        title: Text('${serviceProvider.name} Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(serviceProvider.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          serviceProvider.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(serviceProvider.category),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Color(0xff647a5a),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.message,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Color(0xff647a5a),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.bookmark,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin, size: 14),
                        SizedBox(width: 4),
                        Text(serviceProvider.location),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "from",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "R${serviceProvider.hourlyRate}".toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Ratings, Orders, Experience

                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.star_outline, size: 16),
                          Text(serviceProvider.rating.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Rating",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Icon(Icons.settings_outlined, size: 16),
                          Text(serviceProvider.completedOrders.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Completed",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Icon(Icons.info_outline, size: 16),
                          Text(
                            '${serviceProvider.yearsOfExperience} Years'
                                .toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Experience",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About ${serviceProvider.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      serviceProvider.bio,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   style:
                //       ElevatedButton.styleFrom(backgroundColor: Colors.black),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => BookingForm(
                //           serviceProvider: serviceProvider,
                //         ),
                //       ),
                //     );
                //   },
                //   child: Text('Book Now'),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingForm(
                          serviceProvider: serviceProvider,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(14),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Color(0xff007ba7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Book ${serviceProvider.name}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
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
