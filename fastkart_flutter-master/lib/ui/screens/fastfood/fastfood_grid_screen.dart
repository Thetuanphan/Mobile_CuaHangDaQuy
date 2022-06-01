import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_grid.dart';
import 'package:fast_cart/ui/screens/liquor/varification/varification_screen.dart';
import 'package:fast_cart/ui/screens/medicine/medicine_grid.dart';
import 'package:fast_cart/ui/screens/profile/profile_screen.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_indicator.dart';
import 'package:fast_cart/ui/widgets/shop_card_for_all.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'fast_food_detailed.dart';
import 'restaurant_detailed_screen.dart';

class FastFoodGridScreen extends StatefulWidget {
  static const route = '/FastFoodGridScreen';
  @override
  _FastFoodGridScreenState createState() => _FastFoodGridScreenState();
}

class _FastFoodGridScreenState extends State<FastFoodGridScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarWithTabbar(context),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Text(
              'Dish Menu',
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, GroceryShopGrid.route);
                  },
                  child: topCategoryButton(
                      title: 'Burger', assets: 'assets/burger.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, VarificationScreeen.route);
                  },
                  child: topCategoryButton(
                      title: 'Pizza', assets: 'assets/pizza.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FastFoodGridScreen.route);
                  },
                  child: topCategoryButton(
                      title: 'Pasta', assets: 'assets/pasta.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MedicineShopGrid.route);
                  },
                  child: topCategoryButton(
                      title: 'Salad', assets: 'assets/salad.png'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: SizeConfig.screenHeight,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  allSection(),
                  Text('123'),
                  reastaurantSection(),
                  nearmeSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomTabs(
        index: 0,
      ),
    );
  }

  appBarWithTabbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/top.png'))),
      // padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButton(
                    color: Colors.white,
                  ),
                  Container(
                    child: Text(
                      'Fast Food',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileScreen.route);
                    },
                    child: Container(
                        child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(SampleProfileImageUrl),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 10,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                onChanged: (value) {},
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  hintText: 'Search here..',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/pin.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: appColorPrimary,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            TabBar(
              indicatorColor: appColorPrimary,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              controller: _tabController,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.blockSizeHorizontal * 4),
              unselectedLabelStyle:
                  TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.5),
              labelPadding: EdgeInsets.zero,
              indicator: CircleTabIndicator(color: Colors.white, radius: 5),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Street',
                ),
                Tab(
                  text: 'Restaurant',
                ),
                Tab(
                  text: 'Near Me',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  reastaurantSection() {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Shop Name',
          subTitle: 'Location Name',
          imageUrl: RestaurantImage,
          quantity: '1 km',
          route: RestaurantDetailedScreen.route,
        );
      },
    );
  }

  nearmeSection() {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Shop Name',
          subTitle: 'Location Name',
          imageUrl: RestaurantImage,
          quantity: '1 km',
          route: RestaurantDetailedScreen.route,
        );
      },
    );
  }

  allSection() {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Shop Name',
          subTitle: 'Location Name',
          imageUrl: burgerImage,
          quantity: '1 km',
          route: FastFoodDetailedScreen.route,
        );
      },
    );
  }

  topCategoryButton({String assets, String title}) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 22,
      height: SizeConfig.blockSizeHorizontal * 18,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 1.2),
      decoration: BoxDecoration(
          color: appColorPrimary2, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            assets,
            height: SizeConfig.blockSizeHorizontal * 8,
            width: SizeConfig.blockSizeHorizontal * 6,
            fit: BoxFit.fill,
          ),
          Text(
            title,
            style: TextStyle(
                color: appTextColor.withOpacity(0.8),
                fontSize: SizeConfig.blockSizeHorizontal * 3,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
