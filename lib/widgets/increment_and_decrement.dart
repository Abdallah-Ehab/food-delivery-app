import 'package:flutter/material.dart';

class IncrementAndDecrement extends StatelessWidget {

  void Function() increment;
  void Function() decrement;
  String quantity;
   IncrementAndDecrement({super.key,required this.increment,required this.decrement,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: increment, icon: const Icon(Icons.add),iconSize: 15,),
          SizedBox(
            width: 20,
            child: Text(quantity,style: TextStyle(fontSize: 14),)),
          IconButton(onPressed: decrement, icon: const Icon(Icons.remove),iconSize: 15,)
          
        ],
      ),
    );
  }
}