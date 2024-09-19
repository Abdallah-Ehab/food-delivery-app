import 'package:delivery_app/screens/settings_screen.dart';
import 'package:delivery_app/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top:100),child: Icon(Icons.food_bank,size: 100,),),
          const Divider(color: Colors.white,),

          MyDrawerTile(icon: const Icon(Icons.settings,size: 50), title: "S E T T I N G S", onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SettingsScreen()));
          }),
          const Divider(color: Colors.white,),
          MyDrawerTile(icon: const Icon(Icons.shopping_cart,size: 50,), title: "C A R T", onTap: (){}),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: MyDrawerTile(icon: const Icon(Icons.logout), title: "L O G O U T", onTap: (){}))
        ],
      ),
    );
  }
}