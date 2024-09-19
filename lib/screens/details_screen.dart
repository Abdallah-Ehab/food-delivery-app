import 'package:delivery_app/models/cart_item.dart';
import 'package:delivery_app/models/food_model.dart';
import 'package:delivery_app/models/restaurant.dart';
import 'package:delivery_app/screens/cart_screen.dart';
import 'package:delivery_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final FoodModel foodItem;
  DetailsScreen({super.key, required this.foodItem});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Map<Extras, bool> addedExtras = {};
  
  @override
  void initState() {
    super.initState();
    
    for (var extra in widget.foodItem.extras!) {
      addedExtras[extra] = false;
    }
  }

  List<Extras> getSelectedExtras(){
    List<Extras> listOfExtras = [];
    listOfExtras = widget.foodItem.extras!.where((extra){
      return addedExtras[extra] == true;
    }).toList();
    return listOfExtras;
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  widget.foodItem.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration:const  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black38, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.foodItem.title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold
                ),),
                Text(widget.foodItem.desc),
                Text("\$ ${widget.foodItem.price}")
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics:const NeverScrollableScrollPhysics(),
              itemCount: widget.foodItem.extras!.length,
              itemBuilder: (context, index) {
                var extra = widget.foodItem.extras![index];
                bool isSelected = addedExtras[extra]!;
            
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), 
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(color: Theme.of(context).primaryColor)
                  ),
                  child: CheckboxListTile(
                    title: Text(extra.title),
                    subtitle: Text('\$${extra.price.toString()}'),
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        addedExtras[extra] = value!;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Theme.of(context).scaffoldBackgroundColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: MyButton(text: "Add to cart", onTap: (){
              var listOfExtras = getSelectedExtras();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
              restaurant.addToCart(CartItem(title: widget.foodItem.title, price: widget.foodItem.price,image: widget.foodItem.image, extras: listOfExtras));
            }),
          )
        ],
      ),
    );
  }
}
