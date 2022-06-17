import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/profile/update_profile_screen.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const route = '/ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarForDetailedScreen(
              height: SizeConfig.blockSizeHorizontal * 40,
              text: 'My Profile',
            ),
            profileSection(context),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Dashboard',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 5.3,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 3,
                    color: appColorPrimary,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 600,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        profileTile(
                            title: 'My Order', iconAsset: 'assets/order2.png'),
                        profileTile(
                            title: 'My Cart', iconAsset: 'assets/cart 2.png'),
                        profileTile(
                            title: 'My Favourite',
                            iconAsset: 'assets/fav 2.png'),
                        profileTile(
                            title: 'Referrals', iconAsset: 'assets/ref..png'),
                        profileTile(
                            title: 'Rate us', iconAsset: 'assets/rating.png'),
                        profileTile(
                            title: 'Help & Support',
                            iconAsset: 'assets/support.png'),
                        profileTile(
                            title: 'Notifications',
                            iconAsset: 'assets/notification.png'),
                        profileTile(
                            title: 'Logout', iconAsset: 'assets/logout.png'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomTabs(
        index: 5,
      ),
    );
  }

  profileSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              SampleProfileImageUrl,
              width: SizeConfig.blockSizeHorizontal * 30,
              height: SizeConfig.blockSizeHorizontal * 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: appTextColor.withOpacity(0.5),
                        fontSize: SizeConfig.blockSizeHorizontal * 3),
                  ),
                  Text(
                    'Full Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                        color: appTextColor.withOpacity(0.5),
                        fontSize: SizeConfig.blockSizeHorizontal * 3),
                  ),
                  Text(
                    '+91 9876543210',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, UpdateProfileScreen.route);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 3),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'see more',
                        style: TextStyle(color: appColorPrimary),
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  profileTile({String iconAsset, String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconAsset,
                height: SizeConfig.blockSizeHorizontal * 7,
                width: SizeConfig.blockSizeHorizontal * 7,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 2,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: SizeConfig.blockSizeHorizontal * 3.5,
          ),
        ],
      ),
    );
  }
}
