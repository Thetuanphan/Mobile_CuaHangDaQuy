import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/ui/widgets/shop_card_for_all.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastFoodDetailedScreen extends StatefulWidget {
  static const route = '/FastFoodDetailedScreend';

  @override
  _FastFoodDetailedScreenState createState() => _FastFoodDetailedScreenState();
}

class _FastFoodDetailedScreenState extends State<FastFoodDetailedScreen>
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
            shopAboutSection(),
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
            imageUrl: burgerImage,
            route: FastFoodDetailedScreen.route,
          );
        },
      ),
    );
  }

  shopImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        burgerImage,
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
      ],
    );
  }
}
