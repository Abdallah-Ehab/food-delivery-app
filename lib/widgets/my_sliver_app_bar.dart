import 'package:delivery_app/screens/cart_screen.dart';
import 'package:delivery_app/widgets/my_tab_bar.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  Widget background;
  String title;
  TabController tabController;
  MySliverAppBar({super.key,required this.background,required this.title,required this.tabController});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        background: background,
        title: MyTabBar(controller: tabController),
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
      ),
      title: Text(title),
      centerTitle: true,
      pinned: true,
      floating: false,
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
        }, icon:const Icon(Icons.shopping_cart))
      ],
    );
  }
}