import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/product_detailed_Screen/product_detailed_Screen.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/ui/widgets/shop_card_for_all.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:fast_cart/utills/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryShopDetailed extends StatefulWidget {
  static const route = '/GroceryShopDetailedd';

  @override
  _GroceryShopDetailedState createState() => _GroceryShopDetailedState();
}

class _GroceryShopDetailedState extends State<GroceryShopDetailed>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<String> _filters = ['Highest', 'Lowest', 'Poor'];
  String filterDownValue = 'Highest';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarForDetailedScreen(
              height: SizeConfig.blockSizeHorizontal * 40,
              text: 'Grocery',
            ),
            SizedBox(
              height: 20,
            ),
            shopImage(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amberAccent,
                        ),
                        Text('4.5'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Shop Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: appTextColor,
                              fontSize: SizeConfig.blockSizeHorizontal * 5),
                        ),
                        Text(
                          'Location Name',
                          style: TextStyle(
                            color: appTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: appColorPrimary,
                        ),
                        Text('1 km'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TabBar(
                indicatorColor: appColorPrimary,
                isScrollable: false,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.w600),
                unselectedLabelColor: appColorPrimary,
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: appColorPrimary),
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Tab(
                      text: 'About',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Tab(
                      text: 'Items',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Tab(
                      text: 'Review',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.screenHeight,
              child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    shopAboutSection(),
                    Column(
                      children: [
                        itemSection(),
                      ],
                    ),
                    Column(
                      children: [
                        shopReviewSection(),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabs(
        index: 0,
      ),
    );
  }

  itemSection() {
    return Expanded(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ShopCardForAll(
            title: 'Item Name',
            quantity: '250',
            subTitle: 'Qty.',
            imageUrl: groceryImage,
            route: ProductDetailedScreen.route,
          );
        },
      ),
    );
  }

  shopImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        groceryImage2,
        height: SizeConfig.screenWidth * 0.5,
        width: SizeConfig.screenWidth * 0.9,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  shopAboutSection() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                LoremText,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 3,
                color: appTextColor,
              ),
              SizedBox(
                height: 5,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Certified',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                              color: appTextColor.withOpacity(0.5)),
                        ),
                        Icon(Icons.rate_review)
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                              color: appTextColor.withOpacity(0.5)),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: SizeConfig.screenWidth * 1,
          margin: EdgeInsets.all(10),
          height: SizeConfig.screenHeight * 0.3,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20), child: LocationMap()),
        )
      ],
    );
  }

  shopReviewSection() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: appColorPrimary),
                      child: Icon(
                        Icons.star_rate_rounded,
                        size: SizeConfig.blockSizeHorizontal * 5,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          size: SizeConfig.blockSizeHorizontal * 5,
                          color: Colors.amberAccent,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          size: SizeConfig.blockSizeHorizontal * 5,
                          color: Colors.amberAccent,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          size: SizeConfig.blockSizeHorizontal * 5,
                          color: Colors.amberAccent,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          size: SizeConfig.blockSizeHorizontal * 5,
                          color: Colors.amberAccent,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          size: SizeConfig.blockSizeHorizontal * 5,
                          color: Colors.amberAccent,
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: SizeConfig.blockSizeHorizontal * 40,
                  height: SizeConfig.blockSizeHorizontal * 12,
                  child: DropdownButtonFormField(
                    hint: Text('Filters..'),
                    iconSize: 0,
                    items: _filters.map((String filter) {
                      return new DropdownMenuItem(
                        value: filter,
                        child: Text(filter),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // do other stuff with _filters
                      setState(() => filterDownValue = newValue);
                    },
                    value: filterDownValue,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
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
                        suffixIcon: Container(
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: appColorPrimary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return reviewCard();
                }),
          ),
        ],
      ),
    );
  }

  reviewCard() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 2,
          vertical: SizeConfig.blockSizeHorizontal * 2),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.blockSizeHorizontal * 8,
              backgroundImage: NetworkImage(SampleProfileImageUrl),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sushant',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Best Shop, Best Quality',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
