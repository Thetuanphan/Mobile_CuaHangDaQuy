import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/profile/profile_screen.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// this app bar is for title and backbutton only
class AppBarForDetailedScreen extends StatelessWidget {
  String text;
  double height;

  AppBarForDetailedScreen({
    this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/top.png'))),
      // padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      height: height,
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
                      text,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/cart button.png'),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 10,
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Default Set Location',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/pin.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: appColorPrimary,
                  ),
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

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// this app bar is for opening a drawer like in the main dashboard app bar

class MainDashBoardAppBar extends StatelessWidget {
  String text;
  final GlobalKey<ScaffoldState> scaffoldKey;
  double height;
  String textfiledIcon;

  MainDashBoardAppBar(
      {this.text, this.scaffoldKey, this.height, this.textfiledIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/top.png'))),
      // padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      height: height,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState.openDrawer();
                    },
                    child: Image.asset(
                      'assets/menu.png',
                      height: SizeConfig.blockSizeHorizontal * 7,
                      width: SizeConfig.blockSizeHorizontal * 7,
                    ),
                  ),
                  Container(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileScreen.route);
                    },
                    child: Container(
                        child: CircleAvatar(
                      radius: SizeConfig.blockSizeHorizontal * 5.6,
                      backgroundImage: NetworkImage(SampleProfileImageUrl),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: SizeConfig.blockSizeHorizontal * 10,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                onChanged: (value) {},
                cursorColor: appColorPrimary,
                decoration: InputDecoration(
                  hintText: 'Search here..',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      textfiledIcon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: appColorPrimary,
                  ),
                  enabledBorder: OutlineInputBorder(
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
                  border: new OutlineInputBorder(
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

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class MainDashBoardAppBar2 extends StatelessWidget {
  String text;
  bool showBackButton;
  double height;
  String textfiledIcon;

  MainDashBoardAppBar2({this.text, this.height, this.textfiledIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/top.png'))),
      // padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 4),
      height: height,
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
                      text,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Image.asset(
                    'assets/cart button.png',
                    height: 30,
                    width: 30,
                  )
                ],
              ),
            ),
            Container(
              height: 35,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                onChanged: (value) {},
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  hintText: 'Search here..',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      textfiledIcon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: appColorPrimary,
                  ),
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

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
