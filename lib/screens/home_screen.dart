import 'package:delivery_app/models/food_model.dart';
import 'package:delivery_app/models/restaurant.dart';
import 'package:delivery_app/screens/details_screen.dart';
import 'package:delivery_app/widgets/details_card.dart';
import 'package:delivery_app/widgets/food_tile.dart';
import 'package:delivery_app/widgets/my_drawer.dart';
import 'package:delivery_app/widgets/my_location.dart';
import 'package:delivery_app/widgets/my_sliver_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //filter the foods according to category
  List<FoodModel> getTheRightCategory(List<FoodModel> menu, CATEGORY category) {
    return menu.where((element) {
      return element.category == category;
    }).toList();
  }

// tab controller:
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: CATEGORY.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              MySliverAppBar(
                  tabController: _tabController,
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyLocation(onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                  title: const Text("enter your address"),
                                  content: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).primaryColor)
                                      )
                                    ),
                                  ),
                                  actions: [TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child:  Text("ok",style: Theme.of(context).textTheme.bodyMedium,),
                                  ), TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("cancel",style: Theme.of(context).textTheme.bodyMedium),
                                  )],
                                );
                              });
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        const DetailsCard(),
                      ],
                    ),
                  ),
                  title: "Home page")
            ];
          },
          body: Consumer<Restaurant>(builder: (context, restaurant, child) {
            List<FoodModel> menu = restaurant.menu;
            return TabBarView(
              controller: _tabController,
              children: CATEGORY.values.map((category) {
                var categoryItems = getTheRightCategory(menu, category);

                return Padding(
                  padding: EdgeInsets.zero,
                  child: ListView.builder(
                    itemCount: categoryItems.length,
                    itemBuilder: (context, index) {
                      var foodItem = categoryItems[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen(foodItem: foodItem)));
                            },
                            child: FoodTile(title: foodItem.title, desc: foodItem.desc, image: foodItem.image,price: foodItem.price.toString(),)),
                          Divider(color: Colors.grey[100],)
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            );
          }),
        ),
        drawer: const MyDrawer());
  }
}
