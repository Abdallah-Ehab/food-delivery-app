class FoodModel {
  String title;
  double price;
  String desc;
  String image;
  CATEGORY category;
  List<Extras>? extras;
  
  FoodModel({required this.title,required this.desc,required this.price,required this.image,required this.category,this.extras});

  
}

enum CATEGORY{
    burger,salad
}

class Extras{
  String title;
  double price;

  Extras({required this.title,required this.price});
}