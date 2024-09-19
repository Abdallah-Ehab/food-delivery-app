import 'package:delivery_app/models/restaurant.dart';
import 'package:delivery_app/screens/payment_screen.dart';
import 'package:delivery_app/widgets/cart_item_card.dart';
import 'package:delivery_app/widgets/increment_and_decrement.dart';
import 'package:delivery_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);
    final cart = restaurant.cart;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              restaurant.clearCart();
            }, icon: const Icon(Icons.delete))
          ],
        ),
        body:restaurant.cart.isEmpty?Center(
          child: Text("the cart is empty"),
        ): Padding(
          padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                  var currentItem = cart[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CartItemCard(
                      cartItem: currentItem,
                      incrementanddecrement: IncrementAndDecrement(
                          increment: () {
                            restaurant.addToCart(currentItem);
                          },
                          decrement: () {
                            restaurant.removeItem(currentItem);
                          },
                          quantity: currentItem.amount.toString()),
                    ),
                  );
                }),
              ),

              MyButton(text: "Check out", onTap: (){
                
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Total price : \$ ${restaurant.totalPrice} \n are you sure you want to proceed"),
                    actions: [
                      TextButton(onPressed: 
                      (){
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentScreen()));
                      }, child: Text("ok",style:Theme.of(context).textTheme.bodyMedium,)),
                       TextButton(onPressed: 
                      (){
                        Navigator.of(context).pop();
                      }, child: Text("cancel",style:Theme.of(context).textTheme.bodyMedium,)),
                    ],
                  ); 
                });              })
            ],
          ),
        ));
  }
}
