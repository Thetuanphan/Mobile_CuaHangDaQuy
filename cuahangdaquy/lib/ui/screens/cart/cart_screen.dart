import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const route = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainDashBoardAppBar2(
            height: SizeConfig.blockSizeHorizontal * 38,
            text: 'My Cart',
            textfiledIcon: 'assets/pin.png',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: 5,
              itemBuilder: (context, index) {
                return cartCard();
              },
            ),
          ),
          couponTextField(),
          totalPrice(),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Pay Now',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 20)),
              backgroundColor: MaterialStateProperty.all(appColorPrimary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomTabs(
        index: 3,
      ),
    );
  }

  totalPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Subtotal'), Text('2000')],
          ),
          Divider(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Discount'), Text('100')],
          ),
          Divider(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('100')
            ],
          ),
          Divider(
            height: 5,
          ),
        ],
      ),
    );
  }

  cartCard() {
    return Container(
      margin: EdgeInsets.all(5),
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: Image.network(
                burgerImage,
                height: SizeConfig.blockSizeHorizontal * 30,
                width: SizeConfig.blockSizeHorizontal * 25,
                fit: BoxFit.fill,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Crispy Veg. Burger',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '500',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    'Shop Name',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '250',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: appColorPrimary,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: SizeConfig.blockSizeHorizontal * 4,
                            ),
                          ),
                          Text(
                            '3',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: appColorPrimary,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: SizeConfig.blockSizeHorizontal * 4,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              padding: EdgeInsets.only(right: 3),
              height: SizeConfig.blockSizeHorizontal * 30,
              decoration: BoxDecoration(
                color: appColorPrimary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: RotatedBox(
                quarterTurns: -3,
                child: Text(
                  'Remove',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  couponTextField() {
    return Container(
      height: SizeConfig.blockSizeVertical * 6,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onChanged: (value) {},
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Discount Coupon',
          hintStyle: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 3.2,
              color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: SizeConfig.blockSizeHorizontal * 2),
            child: Image.asset(
              'assets/offer.png',
              height: SizeConfig.blockSizeHorizontal * 4,
              width: SizeConfig.blockSizeHorizontal * 4,
            ),
          ),
          suffixIcon: Container(
            width: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: appColorPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Apply',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColorPrimary),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide(color: appColorPrimary),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColorPrimary),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
