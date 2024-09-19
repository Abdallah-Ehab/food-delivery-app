import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  TabController controller;
  MyTabBar({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Theme.of(context).primaryColor,
        tabs:  [
          Tab(
            child: Icon(Icons.home,color:Theme.of(context).primaryColor),
            
          ),
          Tab(
            child: Icon(
              Icons.grass,
              color: Theme.of(context).primaryColor,
            ),
          )
        ]
        ),
    );
  }
}