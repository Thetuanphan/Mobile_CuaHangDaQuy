import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/login_signup/login_signup_screen.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static String route = '/BottomNav';
  Color color;

  OnBoardingScreen({this.color});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark
        //or set color with: Color(0xFF0000FF)
        ));
  }

  List<String> listOfPic = [
    'assets/get started 1.png',
    'assets/get started 2.png',
    'assets/get started 3.png',
    'assets/get started 4.png',
  ];

  int count = 0;
  bool buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _myPage,
              itemCount: listOfPic.length,
              onPageChanged: (value) {
                setState(() {
                  count = value;
                });
              },
              itemBuilder: (context, index) {
                return PageViewSceens(
                  imageAsset: listOfPic[index],
                );
              },
            ),
          ),
          // MaterialButton(
          //   onPressed: () {
          //     _myPage.nextPage(
          //         duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          //   },
          //   color: appColorPrimary,
          //   padding: EdgeInsets.symmetric(horizontal: 50),
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //   child: Text(
          //     'Next',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 10,
          ),
          _buildCircleIndicator(_myPage, listOfPic),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _buildCircleIndicator(PageController _myPage, List<String> listOfPic) {
    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: _myPage,
          count: listOfPic.length,
          effect: WormEffect(
              dotWidth: 10,
              dotHeight: 5,
              activeDotColor: appColorPrimary,
              dotColor: Colors.grey), // your preferred effect // PageController
        ),
      ),
    );
  }

  goToLoginAndSignUpScreen() {
    Navigator.pushNamed(context, LoginAndSignUpScreen.route);
  }
}

class PageViewSceens extends StatelessWidget {
  String imageAsset;

  PageViewSceens({this.imageAsset});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: Image.asset(
          'assets/logo.png',
          height: 70,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LoginAndSignUpScreen.route);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: appColorPrimary,
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                    ),
                  )),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              imageAsset,
              height: SizeConfig.screenHeight * 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              LoremText,
              textAlign: TextAlign.center,
              maxLines: 4,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal * 10,
          ),
        ],
      ),
    );
  }
}
