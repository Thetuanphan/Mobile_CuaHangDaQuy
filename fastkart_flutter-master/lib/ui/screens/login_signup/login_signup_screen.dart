import 'package:fast_cart/ui/screens/login_signup/sign_in_screen.dart';
import 'package:fast_cart/ui/screens/login_signup/sign_up_screen.dart';
import 'package:fast_cart/ui/widgets/custom_indicator.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginAndSignUpScreen extends StatefulWidget {
  static const route = '/LoginAndSignUpScreen';
  @override
  _LoginAndSignUpScreenState createState() => _LoginAndSignUpScreenState();
}

class _LoginAndSignUpScreenState extends State<LoginAndSignUpScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: SizeConfig.screenHeight * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/login top.png'),
              ),
            ),
            child: TabBar(
              isScrollable: false,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.white,
              controller: _tabController,
              indicator: CircleTabIndicator(color: Colors.white, radius: 5),
              tabs: [
                Tab(
                  child: Container(
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Sign in',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: SignUpScreen(),
                  ),
                  SingleChildScrollView(
                    child: SignInScreen(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
