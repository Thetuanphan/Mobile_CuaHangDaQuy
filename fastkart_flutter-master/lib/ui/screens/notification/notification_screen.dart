import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/NotificationScreen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return notificationCard();
                }),
          )
        ],
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
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Image.network(
                  burgerImage,
                  width: SizeConfig.blockSizeHorizontal * 28,
                  height: SizeConfig.blockSizeVertical * 15,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Crispy Veg. Burger',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.8,
                  ),
                  Text(
                    'Shop Name',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.8,
                  ),
                  Text(
                    '250',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
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
                'Cancelled',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 3),
              ),
            ),
          )
        ],
      ),
    );
  }

  appBar() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/top.png'))),
      // padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      height: SizeConfig.blockSizeVertical * 15,
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
                      'Notification',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      SampleProfileImageUrl,
                      height: SizeConfig.blockSizeVertical * 7,
                      width: SizeConfig.blockSizeVertical * 7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
