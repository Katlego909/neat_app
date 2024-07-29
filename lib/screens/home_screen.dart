// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:neat_test_app/models/service_provider_model.dart';
import 'package:neat_test_app/providers/auth_provider.dart';
import 'package:neat_test_app/providers/service_provider.dart';
import 'package:neat_test_app/screens/categories_screen.dart';
import 'package:neat_test_app/screens/profile_screen.dart';
import 'package:neat_test_app/screens/service_provider_list.dart';
import 'package:neat_test_app/screens/service_provider_list_screen.dart';
import 'package:neat_test_app/screens/service_provider_profile_screen.dart';
import 'package:provider/provider.dart';

// HomeScreen widget for displaying the main screen of the app
class HomeScreen extends StatefulWidget {
  final int selectedIndex; // Index of the currently selected tab
  final ValueChanged<int> onItemTapped; // Callback for handling tab changes

  const HomeScreen(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex; // Local state for storing the selected tab index
  late ValueChanged<int>
      _onItemTapped; // Local callback for handling tab changes

  // List of categories for the service providers
  final List<String> categories = [
    'Home Cleaning',
    'Mobile Car Wash',
    'Gardening',
    'Painting',
    'Handyman',
    'Office Cleaning',
  ];

  // Mapping of category names to their corresponding icons
  final Map<String, IconData> categoryIcons = {
    'Home Cleaning': Icons.cleaning_services_outlined,
    'Mobile Car Wash': Icons.local_car_wash_outlined,
    'Gardening': Icons.grass_outlined,
    'Painting': Icons.format_paint_outlined,
    'Handyman': Icons.plumbing_outlined,
    'Office Cleaning': Icons.house_outlined,
  };

  final TextEditingController _searchController =
      TextEditingController(); // Controller for search text field
  List<ServiceProvider> _filteredProviders =
      []; // List of filtered service providers based on search query

  // List of image paths for the carousel slider
  List<String> carouselImages = [
    "assets/images/slider1.png",
    "assets/images/slider2.png",
    "assets/images/slider3.png",
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // Initialize selected index
    _onItemTapped = widget.onItemTapped; // Initialize callback for item tapped
    _filteredProviders = context
        .read<ServiceProviderProvider>()
        .serviceProviders; // Load initial service providers
    _searchController.addListener(
        _filterProviders); // Add listener to filter providers on search query change
  }

  @override
  void dispose() {
    _searchController
        .removeListener(_filterProviders); // Remove listener when disposing
    _searchController.dispose(); // Dispose search controller
    super.dispose();
  }

  // Method to filter service providers based on the search query
  void _filterProviders() {
    final query = _searchController.text
        .toLowerCase(); // Convert search query to lowercase
    final providers = context
        .read<ServiceProviderProvider>()
        .serviceProviders; // Get list of service providers

    if (query.isEmpty) {
      setState(() {
        _filteredProviders = providers; // No filtering if query is empty
      });
    } else {
      setState(() {
        _filteredProviders = providers.where((provider) {
          return provider.name.toLowerCase().contains(query) ||
              provider.category
                  .toLowerCase()
                  .contains(query); // Filter based on name or category
        }).toList();
      });
    }
  }

  // Method to handle navigation bar item tap
  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
    _onItemTapped(index); // Call the callback for item tapped
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex, // Display the selected screen based on index
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Display username from AuthProvider
                        Consumer<AuthProvider>(
                          builder: (context, authProvider, _) => Text(
                            'Hello, ${authProvider.username}', // Greeting with username
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoriesScreen(), // Navigate to CategoriesScreen
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              // Navigate to ProfileScreen on tap
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.message_outlined),
                              ),
                              // Sign out and navigate to sign-in page
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<AuthProvider>()
                                      .signOut(); // Sign out user
                                  Navigator.pushReplacementNamed(
                                      context, '/sign-in');
                                },
                                icon: Icon(Icons.exit_to_app),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Search text field for filtering service providers
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 14.0,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Carousel slider for displaying images
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 150.0,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          aspectRatio: 16 / 9),
                      items: carouselImages.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.fitWidth,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    // Header for categories section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CategoriesScreen(), // Navigate to CategoriesScreen
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Grid view for displaying category buttons
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Color(0xff657a5b),
                            shadowColor: Colors.grey,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ServiceProviderListScreen(
                                  category: categories[
                                      index], // Pass category to ServiceProviderListScreen
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                categoryIcons[
                                    categories[index]], // Display category icon
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(height: 10),
                              Text(
                                categories[index], // Display category name
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    // Header for top service providers section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Service Providers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AllServiceProvidersPage(), // Navigate to AllServiceProvidersPage
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // List view for displaying filtered service providers
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredProviders.length,
                      itemBuilder: (context, index) {
                        final provider = _filteredProviders[
                            index]; // Get current service provider
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
                                          ServiceProviderProfile(
                                        serviceProvider:
                                            provider, // Pass provider to profile screen
                                      ),
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
                                        provider
                                            .image, // Display provider image
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider
                                                .name, // Display provider name
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            provider
                                                .category, // Display provider category
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "R${provider.hourlyRate.toString()}", // Display provider hourly rate
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          SizedBox(height: 6),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .star, // Display rating star icon
                                                color: Colors.amber,
                                                size: 12,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                provider.rating
                                                    .toString(), // Display provider rating
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                  ],
                ),
              ),
            ),
            // Placeholder for other screens like ProfileScreen(), CategoriesScreen(), etc.
          ],
        ),
      ),
    );
  }
}
