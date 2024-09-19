import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget {
  void Function() onTap;
  MyLocation({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("your delivery",style: Theme.of(context).textTheme.bodyMedium,),
          Row(
          children: [
            Text("your loaction",style:Theme.of(context).textTheme.bodyLarge),
            IconButton(onPressed: onTap,icon:const Icon(Icons.keyboard_arrow_down))
          ],
        )
        ],
        
      )
      
    );
  }
}