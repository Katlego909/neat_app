import 'package:flutter/material.dart';
import 'package:neat_test_app/screens/service_provider_list_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> categories = [
    'Home Cleaning',
    'Mobile Car Wash',
    'Gardening',
    'Painting',
    'Handyman',
    'Office Cleaning',
  ];

  final Map<String, IconData> categoryIcons = {
    'Home Cleaning': Icons.cleaning_services,
    'Mobile Car Wash': Icons.local_car_wash,
    'Gardening': Icons.grass,
    'Painting': Icons.format_paint,
    'Handyman': Icons.plumbing,
    'Office Cleaning': Icons.house,
  };
  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatWidget(categories: categories, categoryIcons: categoryIcons),
      ),
    );
  }
}

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key,
    required this.categories,
    required this.categoryIcons,
  });

  final List<String> categories;
  final Map<String, IconData> categoryIcons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                  category: categories[index],
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categoryIcons[categories[index]],
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                categories[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
