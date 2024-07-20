import 'package:flutter/material.dart';
import 'package:food/animations/FadeAnimation.dart';
import 'package:food/models/shop_model.dart';
import 'package:food/pages/food_details.dart';
import 'package:food/pages/food_item_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {"name": "Pizza", "icon": Icons.local_pizza},
    {"name": "Pasta", "icon": Icons.restaurant_menu},
    {"name": "Dessert", "icon": Icons.cake},
  ];

  int selectedCategory = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  void navigatorToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foods = shop.getFoodsByCategory(categories[selectedCategory]["name"]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foods[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foods = _searchQuery.isEmpty
        ? shop.getFoodsByCategory(categories[selectedCategory]["name"])
        : shop.getAllFoods().where((food) {
            return food.name.toLowerCase().contains(_searchQuery.toLowerCase());
          }).toList();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text('Pizza&Pasta'),
        centerTitle: true,
        actions: [
          FadeAnimation(
              delay: 1,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'CartPage');
                },
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.grey[800],
                ),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow[700],
              ),
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...categories.map((category) {
              return ExpansionTile(
                leading: Icon(category["icon"], color: Colors.grey[700]),
                title: Text(
                  category["name"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                children: shop.getFoodsByCategory(category["name"]).map((food) {
                  return ListTile(
                    title: Text(
                      food.name,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage(
                            food: food,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }).toList(),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search for food...",
                        prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => FadeAnimation(
                            delay: 1,
                            child: makeCategory(
                                title: categories[index]["name"], index: index))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index) => FadeAnimation(
                        delay: 1,
                        child: MakeItem(
                          food: foods[index],
                          onTap: () => navigatorToFoodDetails(index),
                        ))),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({required String title, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: AnimatedContainer(
        width: 120,
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:
              selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    selectedCategory == index ? Colors.white : Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
