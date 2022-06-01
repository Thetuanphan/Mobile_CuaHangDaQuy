import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/fastfood/fastfood_grid_screen.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_grid.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_shop_detailed.dart';
import 'package:fast_cart/ui/screens/liquor/varification/varification_screen.dart';
import 'package:fast_cart/ui/screens/medicine/medicine_grid.dart';
import 'package:fast_cart/ui/widgets/AppDrawer.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/ui/widgets/shop_card_for_all.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  static const route = '/MainDashboard';
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> _randomChildren;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<String> items = [
    'https://media.istockphoto.com/photos/hamburger-with-cheese-and-french-fries-picture-id1188412964',
    'https://media.istockphoto.com/photos/hamburger-with-cheese-and-french-fries-picture-id1188412964',
    'https://media.istockphoto.com/photos/hamburger-with-cheese-and-french-fries-picture-id1188412964',
    'https://media.istockphoto.com/photos/hamburger-with-cheese-and-french-fries-picture-id1188412964',
    'https://media.istockphoto.com/photos/hamburger-with-cheese-and-french-fries-picture-id1188412964',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: CustomDrawer(),
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: DefaultTabController(
                length: 3,
                child: NestedScrollView(
                  headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                    return [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          _randomHeightWidgets(context),
                        ),
                      ),
                    ];
                  },
                  // You tab view goes here
                  body: Stack(
                    children: <Widget>[
                      Container(
                          child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  newlyAdded(),
                                  topItems(),
                                  bestOffer()
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabs(
        index: 1,
      ),
    );
  }

  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren ??= List.generate(1, (index) {
      return Stack(
        children: <Widget>[
          Container(
            child: MainDashBoardAppBar(
              text: 'FastKart',
              scaffoldKey: _scaffoldKey,
              height: SizeConfig.screenHeight * 0.25,
              textfiledIcon: 'assets/filter.png',
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, GroceryShopGrid.route);
                      },
                      child: topCategoryButton(
                          title: 'Grocery', assets: 'assets/grocery.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, VarificationScreeen.route);
                      },
                      child: topCategoryButton(
                          title: 'Liquor', assets: 'assets/alcohol.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FastFoodGridScreen.route);
                      },
                      child: topCategoryButton(
                          title: 'Fast Food', assets: 'assets/fastfood.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MedicineShopGrid.route);
                      },
                      child: topCategoryButton(
                          title: 'Medicine', assets: 'assets/medicine.png'),
                    ),
                  ],
                ),
              ),
              topCarouselSlider(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, GroceryShopGrid.route);
                      },
                      child: topCategoryButton(
                          title: 'BurgerKing', assets: 'assets/burgerking.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, VarificationScreeen.route);
                      },
                      child: topCategoryButton(
                          title: 'Dominos', assets: 'assets/dominos.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FastFoodGridScreen.route);
                      },
                      child: topCategoryButton(
                          title: 'BurgerKing', assets: 'assets/burgerking.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MedicineShopGrid.route);
                      },
                      child: topCategoryButton(
                          title: 'Dominos', assets: 'assets/dominos.png'),
                    ),
                  ],
                ),
              ),
              Container(
                child: TabBar(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  unselectedLabelColor: appColorPrimary,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: appColorPrimary),
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Tab(
                        text: 'Newly Added',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Tab(
                        text: 'Top Items',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Tab(
                        text: 'Best Offers',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    });

    return _randomChildren;
  }

  topCategoryButton({String assets, String title, BuildContext context}) {
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

  bestOffer() {
    return GridView.builder(
      // shrinkWrap: true,
      // primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Burger',
          subTitle: 'Location Name',
          imageUrl: medicineShop,
          quantity: '1 km',
          route: GroceryShopDetailed.route,
        );
      },
    );
  }

  topItems() {
    return GridView.builder(
      // shrinkWrap: true,
      // primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Burger',
          subTitle: 'Location Name',
          imageUrl: RestaurantImage,
          quantity: '1 km',
          route: GroceryShopDetailed.route,
        );
      },
    );
  }

  newlyAdded() {
    return GridView.builder(
      // shrinkWrap: true,
      // primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 30, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ShopCardForAll(
          title: 'Burger',
          subTitle: 'Location Name',
          imageUrl: RestaurantImage,
          quantity: '1 km',
          route: GroceryShopDetailed.route,
        );
      },
    );
  }

  topCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 6,
        autoPlay: true,
      ),
      items: items.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
