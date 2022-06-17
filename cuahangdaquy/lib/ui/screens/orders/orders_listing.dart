import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class OrderListingScreen extends StatelessWidget {
  static const route = '/OrderListingScreen';
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          MainDashBoardAppBar2(
            text: 'Orders',
            height: 150,
            textfiledIcon: 'assets/filter.png',
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return notificationCard();
                }),
          )
        ],
      ),
      bottomNavigationBar: BottomTabs(
        index: 2,
      ),
    );
  }

  notificationCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
      child: Stack(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  child: Image.network(
                    burgerImage,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    height: SizeConfig.blockSizeVertical * 18,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 2,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Crispy Veg. Burger',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Shop Name',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                      Text(
                        '250',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Text(
              '23-05-2021',
              style: TextStyle(
                  color: appTextColor,
                  fontSize: SizeConfig.blockSizeHorizontal * 2.5),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appColorPrimary2,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              height: 30,
              width: 100,
              child: Text(
                'Cancel order',
                style: TextStyle(color: appColorPrimary),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appColorPrimary,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              height: 30,
              width: 130,
              child: Text(
                'Track Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
