import 'package:delivery_app/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  CartItem cartItem;
  Widget incrementanddecrement;
  CartItemCard({super.key, required this.cartItem,required this.incrementanddecrement});

  @override
  Widget build(BuildContext context) {
    return Container(

      
      width: double.infinity,
      height: cartItem.extras.isEmpty ? 110 : 200,
      
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        cartItem.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  
                    SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(cartItem.title),
                        Text("\$ ${cartItem.totalPrice}")
                      ]),
                    ),
          
                ],
              ),
              incrementanddecrement
            ],
          ),
          cartItem.extras.isEmpty
              ? Container()
              : SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: cartItem.extras.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width:200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          
                          children: [
                          Text(cartItem.extras[index].title),
                          Text("\$ ${cartItem.extras[index].price}")
                        ]),
                      ),
                    );
                  }),
                )
        ],
      ),
    );
  }
}
