class ServiceProvider {
  final String id;
  final String name;
  final String image;
  final String bio;
  final String location;
  final double rating;
  final Map<String, double> servicesWithPrices;
  final Map<String, double> additionalServices; // Additional services map
  final Map<String, Map<String, double>> packages;
  final String category;
  final double hourlyRate;
  final int yearsOfExperience;
  final int completedOrders;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.image,
    required this.bio,
    required this.location,
    required this.rating,
    required this.servicesWithPrices,
    required this.additionalServices, // Initialize the additional services
    required this.packages,
    required this.category,
    required this.hourlyRate,
    required this.yearsOfExperience,
    required this.completedOrders,
  });
}
