import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/cart/cart_screen.dart';
import 'package:fast_cart/ui/screens/dashboard/main_dashboard.dart';
import 'package:fast_cart/ui/screens/orders/orders_listing.dart';
import 'package:fast_cart/ui/screens/profile/profile_screen.dart';
import 'package:fast_cart/ui/screens/user_favourite/favourite_screen.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  int index;
  bool showCat;

  BottomTabs({this.index});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: appColorPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (widget.index == 1) {
                return;
              }
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainDashboard()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.index == 1)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                SizedBox(
                  height: 1,
                ),
                Image.asset(
                  'assets/home.png',
                  height: 25,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: textSizeSmall,
                      color:
                          widget.index == 1 ? appColorPrimary2 : Colors.white),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index == 2) {
                return;
              }
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderListingScreen()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.index == 2)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                SizedBox(
                  height: 1,
                ),
                Image.asset(
                  'assets/orders.png',
                  height: 25,
                ),
                Text(
                  "Orders",
                  style: TextStyle(
                      fontSize: textSizeSmall,
                      color:
                          widget.index == 2 ? appColorPrimary2 : Colors.white),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index == 3) {
                return;
              }
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.index == 3)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                SizedBox(
                  height: 1,
                ),
                Image.asset(
                  'assets/cart.png',
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: textSizeSmall,
                        color: widget.index == 3
                            ? appColorPrimary2
                            : Colors.white),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index == 4) {
                return;
              }
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FavouriteScreen()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.index == 4)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                SizedBox(
                  height: 1,
                ),
                Image.asset(
                  'assets/fav..png',
                  height: 25,
                ),
                Text(
                  "Favourite",
                  style: TextStyle(
                      fontSize: textSizeSmall,
                      color:
                          widget.index == 4 ? appColorPrimary2 : Colors.white),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.index == 5) {
                return;
              }
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.index == 5)
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                SizedBox(
                  height: 1,
                ),
                Image.asset(
                  'assets/profile2 .png',
                  height: 25,
                ),
                // Icon(
                //   Icons.shopping_basket,
                //   size: 28,
                // ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: textSizeSmall,
                      color:
                          widget.index == 5 ? appColorPrimary2 : Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
