import 'package:flutter/material.dart';
import 'package:neat_test_app/screens/service_provider_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:neat_test_app/providers/service_provider.dart';

class ServiceProviderListScreen extends StatelessWidget {
  final String category;

  const ServiceProviderListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final providers = context
        .watch<ServiceProviderProvider>()
        .serviceProviders
        .where((provider) => provider.category == category)
        .toList();

    return Scaffold(
      backgroundColor: Color(0xffbfc3b4),
      appBar: AppBar(
        title: Text('$category Providers'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff647a5a),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceProviderProfile(
                            serviceProvider: provider,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 100,
                          child: Image.asset(
                            provider.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              Text(
                                provider.location,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    provider.rating.toString(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
