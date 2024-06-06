import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({super.key});

  @override
  State<SearchFood> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchFood> {
  final List<Map<String, String>> foodItems = [
    {
      'title': 'Oni Sandwich',
      'description': 'Spicy chicken sandwich',
      'calories': '69 Calories',
      'price': '\$6.72',
      'image': 'assets/images/image1.png',
    },
    {
      'title': 'Dan Noodles',
      'description': 'Spicy fruit mixed',
      'calories': '120 Calories',
      'price': '\$8.86',
      'image': 'assets/images/image2.png',
    },
    {
      'title': 'Chicken Dimsum',
      'description': 'Spicy chicken dimsum',
      'calories': '65 Calories',
      'price': '\$6.99',
      'image': 'assets/images/image3.png',
    },
    {
      'title': 'Egg Pasta',
      'description': 'Spicy chicken pasta',
      'calories': '78 Calories',
      'price': '\$9.80',
      'image': 'assets/images/image4.png',
    },
    {
      'title': 'Oni Sandwich',
      'description': 'Spicy chicken sandwich',
      'calories': '69 Calories',
      'price': '\$6.72',
      'image': 'assets/images/image4.png',
    },
    {
      'title': 'Dan Noodles',
      'description': 'Spicy fruit mixed',
      'calories': '120 Calories',
      'price': '\$8.86',
      'image': 'assets/images/image4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Search Food',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: isSmallScreen ? 10.0 : 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/profile_image.jpg',
                width: isSmallScreen ? 30 : 35,
                height: isSmallScreen ? 30 : 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: isSmallScreen ? screenWidth * 0.7 : 290,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Spice Food',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.filter_list,
                      color: Colors.yellow, size: isSmallScreen ? 24 : 30),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Found \n80 results',
              style: TextStyle(
                fontSize: isSmallScreen ? 20 : 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = foodItems[index];
                  return foodItemWidget(
                    foodItem['title']!,
                    foodItem['description']!,
                    foodItem['calories']!,
                    foodItem['price']!,
                    foodItem['image']!,
                    index % 2 == 1,
                    isSmallScreen,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodItemWidget(String title, String description, String calories,String price, String imagePath, bool isRightColumn, bool isSmallScreen) {
    return Container(
      margin: EdgeInsets.only(
        top: isRightColumn ? 0.0 : 30.0,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(top: isSmallScreen ? 50 : 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: isSmallScreen ? 20 : 40),
                  Text(title,
                      style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(description,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: isSmallScreen ? 12 : 14)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_fire_department,
                          color: Colors.orange, size: isSmallScreen ? 14 : 16),
                      const SizedBox(width: 10),
                      Text(calories,
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: isSmallScreen ? 12 : 14)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(price,
                      style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    height: isSmallScreen ? 80 : 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
