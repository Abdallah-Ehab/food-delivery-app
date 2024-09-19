import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  String title;
  String desc;
  String image;
  String price;
  FoodTile(
      {super.key,
      required this.title,
      required this.desc,
      required this.image,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text("\$ $price")
              ],
            ),
          ),
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image)))
        ],
      ),
    );
  }
}
