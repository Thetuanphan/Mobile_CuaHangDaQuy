import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  static const route = '/WalletScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarForWallet(),
            SizedBox(
              height: 15,
            ),
            Text(
              'Saved Card',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return savedCreditCard();
                  }),
            )
          ],
        ),
      ),
    );
  }

  appBarForWallet() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/top.png'))),
      // padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      height: SizeConfig.screenHeight * 0.31,
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
                      'My Wallet',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      SampleProfileImageUrl,
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Available amount',
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 3,
                color: Colors.white,
              ),
            ),
            Text(
              '500',
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  color: Colors.white),
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 12,
              width: SizeConfig.blockSizeHorizontal * 50,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                onChanged: (value) {},
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter amount here',
                  filled: true,
                  fillColor: Colors.white,
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
          ],
        ),
      ),
    );
  }

  savedCreditCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: SizeConfig.blockSizeHorizontal * 75,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: appColorPrimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: Colors.white,
                        size: SizeConfig.blockSizeHorizontal * 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white.withOpacity(0.8),
                            size: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white.withOpacity(0.8),
                            size: SizeConfig.blockSizeHorizontal * 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Card No.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '1200',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      Text(
                        '1200',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      Text(
                        '1200',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      Text(
                        '1200',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Exp. Date',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 3),
                  ),
                  Text(
                    '03/2024',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 3),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Card Holder Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 2.5),
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
