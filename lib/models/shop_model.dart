import 'package:flutter/material.dart';
import 'package:food/models/foodmodel.dart';

class Shop extends ChangeNotifier {
  final List<Foods> _foods = [
    Foods(
      name: 'Chicken Ranch',
      imagePath: 'assets/images/one.jpg',
      price: '50.00',
      description: 'Indulge in a mouthwatering fusion of flavors with our signature Chicken Ranch Pizza...',
      category: 'Pizza',
    ),
    Foods(
      name: 'Vegetarian Pizza',
      imagePath: 'assets/images/two.jpg',
      price: '45.00',
      description: 'Indulge in a mouthwatering fusion of flavors with our signature Vegetarian Pizza...',
      category: 'Pizza',
    ),
    Foods(
      name: 'Margherita Pizza',
      imagePath: 'assets/images/MargheritaPizza .jpg',
      price: '41.00',
      description: 'Indulge in a mouthwatering fusion of flavors with our signature Margherita Pizza...',
      category: 'Pizza',
    ),
    Foods(
      name: 'Pepperoni Pizza',
      imagePath: 'assets/images/three.jpg',
      price: '42.00',
      description: 'Indulge in a mouthwatering fusion of flavors with our signature Pepperoni Pizza...',
      category: 'Pizza',
    ),Foods(
      name: 'Chicago Pizza',
      imagePath: 'assets/images/manvi-mathur-Q2BlVtHOcAk-unsplash.jpg',
      price: '40.00',
      description: 'Indulge in a mouthwatering fusion of flavors with our signature Chicago Pizza...',
      category: 'Pizza',
    ),

    Foods(
      name: 'Spaghetti Carbonara',
      imagePath: 'assets/images/spaghetti-with-mixed-ingredients-white-plate.jpg',
      price: '30.00',
      description: 'Enjoy the classic Italian dish with our Spaghetti Carbonara...',
      category: 'Pasta',
    ),
     Foods(
      name: 'Authentic italian pasta',
      imagePath: 'assets/images/authentic-italian-pasta.jpg',
      price: '22.00',
      description: 'Enjoy the classic Italian dish with our authentic italian pasta...',
      category: 'Pasta',
    ), Foods(
      name: 'Lasagna with bolognese',
      imagePath: 'assets/images/classic-lasagna-with-bolognese-sauce.jpg',
      price: '24.00',
      description: 'Enjoy the classic Italian dish with our Lasagna with bolognese...',
      category: 'Pasta',
    ), Foods(
      name: 'Cheesy pasta ',
      imagePath: 'assets/images/top-view-cheesy-pasta-white-plate.jpg',
      price: '27.00',
      description: 'Enjoy the classic Italian dish with our Spaghetti Cheesy pasta...',
      category: 'Pasta',
    ), Foods(
      name: 'Pasta With Meatballs',
      imagePath: 'assets/images/top-view-tasty-italian-pasta-with-meatballs-dark-blue-background.jpg',
      price: '25.00',
      description: 'Enjoy the classic Italian dish with our Spaghetti Pasta With Meatballs...',
      category: 'Pasta',
    ),
    Foods(
      name: 'Chocolate Dessert',
      imagePath: 'assets/images/front-view-chocolate-dessert-glass-with-straw.jpg',
      price: '13.00',
      description: 'Savor the sweet and creamy taste of our Chocolate Dessert...',
      category: 'Dessert',
    ),
    Foods(
      name: 'Honey Cake',
      imagePath: 'assets/images/side-view-piece-honey-cake.jpg',
      price: '20.00',
      description: 'Savor the sweet and creamy taste of our Honey Cake...',
      category: 'Dessert',
    ),Foods(
      name: 'Strawberry Cheesecake',
      imagePath: 'assets/images/cheesecake-with-strawberry-table.jpg',
      price: '10.00',
      description: 'Savor the sweet and creamy taste of our Strawberry Cheesecake...',
      category: 'Dessert',
    ),Foods(
      name: 'Tiramisu ',
      imagePath: 'assets/images/homemade-chocolate-cake-with-raspberry-sauce-whipped-cream-generated-by-artificial-intelligence.jpg',
      price: '18.00',
      description: 'Savor the sweet and creamy taste of our Tiramisu...',
      category: 'Dessert',
    ),Foods(
      name: 'Donuts',
      imagePath: 'assets/images/delicious-donuts.jpg',
      price: '12.00',
      description: 'Savor the sweet and creamy taste of our Donuts...',
      category: 'Dessert',
    ),
    Foods(
      name: 'Red strawberries with cakes',
      imagePath: 'assets/images/fresh-red-strawberries-mellow-delicious-berries-with-cakes-light.jpg',
      price: '14.00',
      description: 'Savor the sweet and creamy taste of our Red strawberries with cakes...',
      category: 'Dessert',
    ),

  ];

  List<Foods> _cart = [];
  List<Foods> get foods => _foods;
  List<Foods> get cart => _cart;

  // Filter foods by category
  List<Foods> getFoodsByCategory(String category) {
    return _foods.where((food) => food.category == category).toList();
  }

  // Add to cart
  void addToCart(Foods foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // Remove from cart
  void removeCart(Foods food) {
    _cart.remove(food);
    notifyListeners();
  }
   List<Foods> searchFoods(String query) {
    return _foods.where((food) => food.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
  List<Foods> getAllFoods() {
    return List.from(_foods); // Returns a copy of the _foods list
  }
}