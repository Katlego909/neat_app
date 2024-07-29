import 'package:flutter/foundation.dart';
import 'package:neat_test_app/models/service_provider_model.dart';

class ServiceProviderProvider with ChangeNotifier {
  final List<ServiceProvider> _serviceProviders = [
    ServiceProvider(
      id: '1',
      name: 'John M',
      image: 'assets/images/profile8.jpg',
      bio:
          "With over 15 years of experience, John's Home Cleaner is your go-to team for reliable and efficient home services. From plumbing to electrical work, we've got you covered. Our certified professionals are dedicated to ensuring your home sparkling clean and smelling amazing. Trust us to handle your home with the utmost care and expertise.",
      location: 'Johannesburg',
      rating: 4.5,
      servicesWithPrices: {
        'House Cleaning': 250.0,
        'Carpet Cleaning': 150.0,
        'Deep Cleaning': 500.0,
        'Window Cleaning': 200.0,
      },
      additionalServices: {
        'Oven Cleaning': 100.0,
        'Fridge Cleaning': 120.0,
      },
      packages: {
        'Basic': {
          'House Cleaning': 250.0,
          'Window Cleaning': 200.0,
        },
        'Premium': {
          'House Cleaning': 250.0,
          'Carpet Cleaning': 150.0,
          'Deep Cleaning': 500.0,
        },
      },
      category: 'Home Cleaning',
      hourlyRate: 50.0,
      yearsOfExperience: 5,
      completedOrders: 32,
    ),
    ServiceProvider(
      id: '2',
      name: 'Sello H',
      image: 'assets/images/profile7.jpg',
      bio:
          "Elite Cleaning Services brings a touch of sparkle to your home. Our highly trained staff uses eco-friendly products to provide top-notch cleaning solutions tailored to your needs. Whether it’s a one-time deep clean or a regular maintenance schedule, we guarantee a spotless and fresh environment for you and your family.",
      location: 'Cape Town',
      rating: 4.5,
      servicesWithPrices: {
        'Office Cleaning': 250.0,
        'Carpet Cleaning': 150.0,
        'Deep Cleaning': 500.0,
        'Window Cleaning': 200.0,
      },
      additionalServices: {
        'Boardroom Cleaning': 100.0,
        'Rest Room Cleaning': 120.0,
      },
      packages: {
        'Basic': {
          'Office Cleaning': 250.0,
          'Window Cleaning': 200.0,
        },
        'Premium': {
          'Commercial Cleaning': 750.0,
          'Carpet Cleaning': 150.0,
          'Deep Cleaning': 500.0,
        },
      },
      category: 'Office Cleaning',
      hourlyRate: 50.0,
      yearsOfExperience: 5,
      completedOrders: 32,
    ),
    // Add more service providers similarly...
    ServiceProvider(
      id: '3',
      name: 'Jane M',
      image: 'assets/images/profile6.jpg',
      bio: 'Experienced painter with 8 years of experience.',
      location: 'Durban',
      rating: 4.8,
      servicesWithPrices: {
        'Interior Painting': 300.0,
        'Exterior Painting': 400.0,
        'Wallpaper Installation': 200.0,
        'Deck Staining': 250.0,
      },
      additionalServices: {
        'Drywall Repair': 150.0,
        'Furniture Painting': 180.0,
      },
      packages: {
        'Standard': {
          'Interior Painting': 300.0,
          'Exterior Painting': 400.0,
        },
        'Premium': {
          'Interior Painting': 300.0,
          'Exterior Painting': 400.0,
          'Wallpaper Installation': 200.0,
        },
      },
      category: 'Painting',
      hourlyRate: 60.0,
      yearsOfExperience: 8,
      completedOrders: 20,
    ),
    ServiceProvider(
      id: '4',
      name: 'Mike Johnson',
      image: 'assets/images/profile5.jpg',
      bio:
          'Experts offering comprehensive services with a commitment to quality and customer satisfaction. Whether it’s a leaky faucet, a clogged drain, or a complete pipe overhaul, our licensed plumbers deliver prompt and efficient solutions. We’re available 24/7 to meet your emergency needs with reliability you can trust.',
      location: 'Pretoria',
      rating: 4.6,
      servicesWithPrices: {
        'Electrical Repairs': 200.0,
        'Lighting Installation': 150.0,
        'Wiring': 300.0,
        'Generator Installation': 500.0,
      },
      additionalServices: {
        'Ceiling Fan Installation': 100.0,
        'Home Automation': 400.0,
      },
      packages: {
        'Standard': {
          'Electrical Repairs': 200.0,
          'Lighting Installation': 150.0,
        },
        'Deluxe': {
          'Electrical Repairs': 200.0,
          'Lighting Installation': 150.0,
          'Wiring': 300.0,
        },
      },
      category: 'Handyman',
      hourlyRate: 70.0,
      yearsOfExperience: 10,
      completedOrders: 80,
    ),
    ServiceProvider(
      id: '5',
      name: 'Sarah Thompson',
      image: 'assets/images/profile4.jpg',
      bio: 'Professional plumber with 7 years of experience.',
      location: 'Johannesburg',
      rating: 4.9,
      servicesWithPrices: {
        'Pipe Repair': 180.0,
        'Fixture Installation': 120.0,
        'Drain Cleaning': 220.0,
        'Water Heater Installation': 300.0,
      },
      additionalServices: {
        'Toilet Repair': 150.0,
        'Sump Pump Installation': 250.0,
      },
      packages: {
        'Standard': {
          'Pipe Repair': 180.0,
          'Fixture Installation': 120.0,
        },
        'Premium': {
          'Pipe Repair': 180.0,
          'Fixture Installation': 120.0,
          'Drain Cleaning': 220.0,
        },
      },
      category: 'Handyman',
      hourlyRate: 65.0,
      yearsOfExperience: 7,
      completedOrders: 20,
    ),
    ServiceProvider(
      id: '6',
      name: 'David Green',
      image: 'assets/images/profile1.jpg',
      bio:
          "Transform your outdoor space with Green Thumb Gardening. Our team of skilled horticulturists specializes in creating beautiful and sustainable gardens. From landscape design to regular maintenance, we ensure your garden is a thriving, green oasis. Let us bring nature’s beauty to your doorstep.",
      location: 'Cape Town',
      rating: 4.7,
      servicesWithPrices: {
        'Landscape Design': 400.0,
        'Lawn Care': 150.0,
        'Hardscape Construction': 500.0,
        'Irrigation Installation': 300.0,
      },
      additionalServices: {
        'Tree Trimming': 200.0,
        'Garden Maintenance': 250.0,
      },
      packages: {
        'Basic': {
          'Landscape Design': 400.0,
          'Lawn Care': 150.0,
        },
        'Deluxe': {
          'Landscape Design': 400.0,
          'Lawn Care': 150.0,
          'Hardscape Construction': 500.0,
        },
      },
      category: 'Gardening',
      hourlyRate: 75.0,
      yearsOfExperience: 6,
      completedOrders: 90,
    ),
  ];

  List<ServiceProvider> get serviceProviders => _serviceProviders;

  ServiceProvider getServiceProvider(String providerId) {
    return _serviceProviders
        .firstWhere((provider) => provider.id == providerId);
  }
}
