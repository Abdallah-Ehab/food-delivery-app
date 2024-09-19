import 'package:delivery_app/models/cart_item.dart';
import 'package:delivery_app/models/food_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Restaurant with ChangeNotifier {
  final List<FoodModel> _menu = [
    FoodModel(
      title: 'Classic Burger',
      desc: 'A juicy beef patty with fresh lettuce, tomato, and cheese.',
      price: 8.99,
      image: 'assets/images/classic_burger.jpg',
      category: CATEGORY.burger,
      extras: [
        Extras(title: 'Extra Cheese', price: 1.00),
        Extras(title: 'Bacon', price: 1.50),
        Extras(title: 'Avocado', price: 1.75),
      ],
    ),
    FoodModel(
      title: 'Cheese Burger',
      desc: 'Beef patty with melted cheddar cheese, onions, and pickles.',
      price: 9.49,
      image: 'assets/images/cheese_burger.jpg',
      category: CATEGORY.burger,
      extras: [
        Extras(title: 'Extra Cheese', price: 1.00),
        Extras(title: 'Grilled Onions', price: 0.75),
        Extras(title: 'Jalapenos', price: 0.50),
      ],
    ),
    FoodModel(
      title: 'BBQ Burger',
      desc: 'Beef patty with BBQ sauce, grilled onions, and bacon.',
      price: 10.99,
      image: 'assets/images/bbq_burger.jpeg',
      category: CATEGORY.burger,
      extras: [
        Extras(title: 'Extra Bacon', price: 1.50),
        Extras(title: 'Cheddar Cheese', price: 1.00),
        Extras(title: 'Onion Rings', price: 1.75),
      ],
    ),
    FoodModel(
      title: 'Veggie Burger',
      desc: 'Grilled veggie patty with avocado, lettuce, and tomato.',
      price: 7.99,
      image: 'assets/images/veggie_burger.jpg',
      category: CATEGORY.burger,
      extras: [
        Extras(title: 'Vegan Cheese', price: 1.25),
        Extras(title: 'Guacamole', price: 1.75),
        Extras(title: 'Sautéed Mushrooms', price: 1.00),
      ],
    ),
    FoodModel(
      title: 'Spicy Burger',
      desc: 'Spicy beef patty with jalapenos, pepper jack cheese, and chipotle mayo.',
      price: 9.99,
      image: 'assets/images/spicy_burger.jpeg',
      category: CATEGORY.burger,
      extras: [
        Extras(title: 'Extra Spicy Sauce', price: 0.50),
        Extras(title: 'Pepper Jack Cheese', price: 1.00),
        Extras(title: 'Grilled Jalapenos', price: 0.75),
      ],
    ),
    // Salads:===========================================
    FoodModel(
      title: 'Caesar Salad',
      desc: 'Crispy romaine lettuce with parmesan, croutons, and Caesar dressing.',
      price: 6.99,
      image: 'assets/images/caesar_salad.jpeg',
      category: CATEGORY.salad,
      extras: [
        Extras(title: 'Grilled Chicken', price: 2.50),
        Extras(title: 'Extra Parmesan', price: 0.75),
        Extras(title: 'Croutons', price: 0.50),
      ],
    ),
    FoodModel(
      title: 'Greek Salad',
      desc: 'Fresh cucumbers, tomatoes, olives, and feta with Greek dressing.',
      price: 7.49,
      image: 'assets/images/greek_salad.jpg',
      category: CATEGORY.salad,
      extras: [
        Extras(title: 'Grilled Chicken', price: 2.50),
        Extras(title: 'Extra Feta', price: 1.00),
        Extras(title: 'Pita Bread', price: 1.25),
      ],
    ),
    FoodModel(
      title: 'Garden Salad',
      desc: 'Mixed greens with carrots, tomatoes, cucumbers, and vinaigrette.',
      price: 5.99,
      image: 'assets/images/garden_salad.jpeg',
      category: CATEGORY.salad,
      extras: [
        Extras(title: 'Grilled Tofu', price: 2.00),
        Extras(title: 'Extra Vinaigrette', price: 0.50),
        Extras(title: 'Avocado', price: 1.25),
      ],
    ),
    FoodModel(
      title: 'Chicken Salad',
      desc: 'Grilled chicken breast on mixed greens with avocado and ranch.',
      price: 8.99,
      image: 'assets/images/chicken_salad.jpeg',
      category: CATEGORY.salad,
      extras: [
        Extras(title: 'Extra Avocado', price: 1.50),
        Extras(title: 'Bacon', price: 1.50),
        Extras(title: 'Egg', price: 1.00),
      ],
    ),
    FoodModel(
      title: 'Cobb Salad',
      desc: 'Mixed greens with bacon, eggs, avocado, blue cheese, and ranch.',
      price: 9.49,
      image: 'assets/images/cobb_salad.jpeg',
      category: CATEGORY.salad,
      extras: [
        Extras(title: 'Extra Blue Cheese', price: 1.25),
        Extras(title: 'Grilled Chicken', price: 2.50),
        Extras(title: 'Bacon', price: 1.50),
      ],
    ),
  ];

  final List<CartItem> _cart = [];

  List<FoodModel> get menu => _menu;
  List<CartItem> get cart => _cart;

  double get totalPrice {
    return _cart.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(CartItem cartItem) {
    CartItem? tempItem = _cart.firstWhereOrNull((item) {
      return item.title == cartItem.title && listEquals(item.extras, cartItem.extras);
    });
    
    if (tempItem != null) {
      tempItem.amount += 1;
    } else {
      _cart.add(cartItem);
    }
    notifyListeners();
  }

  void removeItem(CartItem cartItem) {
    CartItem? tempItem = _cart.firstWhereOrNull((item) {
      return item.title == cartItem.title && listEquals(item.extras, cartItem.extras);
    });
    
    if (tempItem != null) {
      tempItem.amount -= 1;

      if (tempItem.amount <= 0) {
        _cart.remove(tempItem);
      }
    }
    notifyListeners();
  }

  void clearCart(){
  cart.clear();
  notifyListeners();
}
}



extension on List<CartItem> {
  CartItem? firstWhereOrNull(bool Function(CartItem element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

