import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_shop_detailed.dart';
import 'package:fast_cart/ui/screens/profile/profile_screen.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_indicator.dart';
import 'package:fast_cart/ui/widgets/shop_card_for_all.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class GroceryShopGrid extends StatefulWidget {
  static const route = '/GroceryShopGrid';

  @override
  _GroceryShopGridState createState() => _GroceryShopGridState();
}

class _GroceryShopGridState extends State<GroceryShopGrid>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBarWithTabbar(context),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
          //   child: Text(
          //     'Top Shops',
          //     style: TextStyle(
          //         fontSize: SizeConfig.blockSizeHorizontal * 4,
          //         fontWeight: FontWeight.w600),
          //   ),
          // ),
          Expanded(
            child: Container(
              height: SizeConfig.screenHeight,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  allSection(),
                  nearBy(),
                  topShops(),
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
                      'Grocery',
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
                  text: 'Near By',
                ),
                Tab(
                  text: 'Top Shops',
                ),
              ],
            ),
          ],
        ),
      ),
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
          imageUrl: groceryImage,
          quantity: '1 km',
          route: GroceryShopDetailed.route,
        );
      },
    );
  }

  nearBy() {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Shop Name',
          subTitle: 'Location Name',
          imageUrl: groceryImage2,
          quantity: '1 km',
          route: GroceryShopDetailed.route,
        );
      },
    );
  }

  topShops() {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Shop Name',
          subTitle: 'Location Name',
          imageUrl: groceryImage,
          quantity: '1 km',
          route: GroceryShopDetailed.route,
        );
      },
    );
  }
}
