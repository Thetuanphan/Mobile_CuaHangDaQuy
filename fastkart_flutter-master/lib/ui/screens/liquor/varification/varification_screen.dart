import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'upload_identity_screen.dart';

class VarificationScreeen extends StatelessWidget {
  static const route = '/VarificationScreeen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: BackButton(
          color: appColorPrimary,
        ),
        title: Text(
          'Restriction',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/gaurd.png',
                height: SizeConfig.blockSizeHorizontal * 30,
                width: SizeConfig.blockSizeHorizontal * 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You need to be above \n21 year of age',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: appColorPrimary, width: 2)),
                  child: Container(
                    height: SizeConfig.screenWidth * 0.5,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'You must be of',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4),
                            children: <InlineSpan>[
                              TextSpan(
                                text: ' legal drinking age',
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '\nto order from liquor shops.',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'As per Govt. guidelines,',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4),
                            children: <InlineSpan>[
                              TextSpan(
                                text: ' you have to',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                ),
                              ),
                              TextSpan(
                                text: '\nupload a Govt. ID',
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' to verify your age',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -13,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: appColorPrimary),
                          ),
                          Image.asset(
                            'assets/beer.png',
                            width: SizeConfig.blockSizeHorizontal * 12,
                            height: SizeConfig.blockSizeHorizontal * 12,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: appColorPrimary),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  text: 'ID detail are needed for one-time verification.',
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3),
                  children: <InlineSpan>[
                    TextSpan(
                      text: ' It is safe & secure.',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Read our privacy policy to learn more',
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Read Policy',
                  style: TextStyle(
                      color: appColorPrimary, fontWeight: FontWeight.w700),
                ))
          ],
        ),
      ),
      bottomNavigationBar: nextButton(context),
    );
  }

  nextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, UploadIdentityScreen.route);
        },
        child: Text(
          'Start one-time verification',
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        color: appColorPrimary,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
