import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/cart/cart_screen.dart';
import 'package:fast_cart/ui/screens/notification/notification_screen.dart';
import 'package:fast_cart/ui/screens/orders/orders_listing.dart';
import 'package:fast_cart/ui/screens/profile/profile_screen.dart';
import 'package:fast_cart/ui/screens/user_favourite/favourite_screen.dart';
import 'package:fast_cart/ui/screens/wallet/wallet_screen.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 10,
                        backgroundImage: NetworkImage(SampleProfileImageUrl),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Hi, Jasmeen',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: textSizeMedium,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '+91 9876543210',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: textSizeMedium,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();

                                Navigator.pushNamed(
                                    context, ProfileScreen.route);
                              },
                              child: Text(
                                'View Profile',
                                style: TextStyle(
                                  color: appColorPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: textSizeSMedium,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 5,
                    color: appColorPrimary,
                  ),
                ),
                ListTile(
                  title: Text(
                    'My orders',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/order2.png",
                    height: 30,
                    width: 30,
                  ),
                  trailing: notificationCount(count: 8),
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.pushNamed(context, OrderListingScreen.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'My cart',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/cart 2.png",
                    height: 30,
                    width: 30,
                  ),
                  trailing: notificationCount(count: 2),
                  onTap: () {
                    // Update the state of the app
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CartScreen.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'My Favorite',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/fav 2.png",
                    height: 30,
                    width: 30,
                  ),
                  trailing: notificationCount(count: 3),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, FavouriteScreen.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'My Wallet',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/wallet.png",
                    height: 30,
                    width: 30,
                  ),
                  // trailing: notificationCount(count: 3),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, WalletScreen.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'Notification',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/notification.png",
                    height: 30,
                    width: 30,
                  ),
                  trailing: notificationCount(count: 1),
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.pushNamed(context, NotificationScreen.route);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 5,
                    color: appColorPrimary,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Referral',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/ref..png",
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    // Navigator.pushNamed(context, DietPlan.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'Rate',
                    style: TextStyle(
                      color: appTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  leading: Image.asset(
                    "assets/rating.png",
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Help & Support',
                    style: TextStyle(
                      color: appTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  leading: Image.asset(
                    "assets/support.png",
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: appTextColor, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/logout.png",
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  notificationCount({int count}) {
    return Container(
      height: 50,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: appColorPrimary.withOpacity(0.8)),
      child: Text(
        count.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
