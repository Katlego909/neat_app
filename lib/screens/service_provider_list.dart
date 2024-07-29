import 'package:flutter/material.dart';
import 'package:neat_test_app/providers/service_provider.dart';
import 'package:neat_test_app/screens/service_provider_profile_screen.dart';
import 'package:provider/provider.dart';

class AllServiceProvidersPage extends StatelessWidget {
  const AllServiceProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = context.watch<ServiceProviderProvider>().serviceProviders;

    return Scaffold(
      backgroundColor: Color(0xffbfc3b4),
      appBar: AppBar(
        title: Text('All Service Providers'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: providers.length,
          itemBuilder: (context, index) {
            final provider = providers[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Material(
                  color: Color(0xff647a5a),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceProviderProfile(serviceProvider: provider),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff657a5b),
                          ),
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
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                provider.category,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "R${provider.hourlyRate.toString()}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 12,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    provider.rating.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
            );
          },
        ),
      ),
    );
  }
}
