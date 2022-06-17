import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_shop_detailed.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/ui/widgets/shop_card_for_all.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  static const route = '/FavouriteScreen';
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        children: [
          MainDashBoardAppBar2(
            text: 'Liquor',
            height: 150,
            textfiledIcon: 'assets/pin.png',
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 1),
              itemCount: 8,
              itemBuilder: (context, index) {
                return ShopCardForAll(
                  title: 'Shop Name',
                  subTitle: 'License Number',
                  imageUrl: wineShop,
                  quantity: '1 km',
                  route: GroceryShopDetailed.route,
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomTabs(
        index: 4,
      ),
    );
  }
}
