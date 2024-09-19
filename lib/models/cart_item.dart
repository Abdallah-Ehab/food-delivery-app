import 'package:delivery_app/models/food_model.dart';

class CartItem {
  final String title;
  final String image;
  int amount;
  double price;
  final List<Extras> extras;

  CartItem({
    required this.title,
    required this.image,
    this.amount = 1,
    required this.price,
    required this.extras,
  });

  

  double get totalPrice{
    double extrasPrice = extras.fold(0, (sum,extra)=>sum+extra.price);
    return (price + extrasPrice)*amount;
  }

  
}
