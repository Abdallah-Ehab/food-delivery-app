import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  String title;
  Widget icon;
  void Function() onTap;
  MyDrawerTile({super.key,required this.icon,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            icon,
            Text(title,style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
      ),
    );
  }
}