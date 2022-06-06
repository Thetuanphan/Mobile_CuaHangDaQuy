import 'package:fast_cart/bloc/auth/auth_bloc.dart';
import 'package:fast_cart/ui/screens/cart/cart_screen.dart';
import 'package:fast_cart/ui/screens/fastfood/fast_food_detailed.dart';
import 'package:fast_cart/ui/screens/fastfood/fastfood_grid_screen.dart';
import 'package:fast_cart/ui/screens/fastfood/restaurant_detailed_screen.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_grid.dart';
import 'package:fast_cart/ui/screens/grocery/grocery_shop_detailed.dart';
import 'package:fast_cart/ui/screens/liquor/liquor_grid.dart';
import 'package:fast_cart/ui/screens/liquor/liquor_shop_detailed.dart';
import 'package:fast_cart/ui/screens/liquor/varification/upload_identity_screen.dart';
import 'package:fast_cart/ui/screens/login_signup/login_signup_screen.dart';
import 'package:fast_cart/ui/screens/medicine/medicine_grid.dart';
import 'package:fast_cart/ui/screens/medicine/medicine_shop_detailed.dart';
import 'package:fast_cart/ui/screens/medicine/prescription_upload_screen.dart';
import 'package:fast_cart/ui/screens/notification/notification_screen.dart';
import 'package:fast_cart/ui/screens/orders/orders_listing.dart';
import 'package:fast_cart/ui/screens/product_detailed_Screen/product_detailed_Screen.dart';
import 'package:fast_cart/ui/screens/profile/new_password_screen.dart';
import 'package:fast_cart/ui/screens/profile/profile_screen.dart';
import 'package:fast_cart/ui/screens/profile/update_profile_screen.dart';
import 'package:fast_cart/ui/screens/user_favourite/favourite_screen.dart';
import 'package:fast_cart/ui/screens/wallet/wallet_screen.dart';
import 'package:fast_cart/ui/splash_screen/splash_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import './ui/./screens/./dashboard/main_dashboard.dart';
import 'ui/screens/liquor/varification/varification_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vàng',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: SplashScreen(),
        routes: {
          LoginAndSignUpScreen.route: (context) => LoginAndSignUpScreen(),
          MainDashboard.route: (context) => MainDashboard(),
          NotificationScreen.route: (context) => NotificationScreen(),
          GroceryShopGrid.route: (context) => GroceryShopGrid(),
          GroceryShopDetailed.route: (context) => GroceryShopDetailed(),
          FastFoodGridScreen.route: (context) => FastFoodGridScreen(),
          RestaurantDetailedScreen.route: (context) =>
              RestaurantDetailedScreen(),
          FastFoodDetailedScreen.route: (context) => FastFoodDetailedScreen(),
          VarificationScreeen.route: (context) => VarificationScreeen(),
          LiquorGridScreen.route: (context) => LiquorGridScreen(),
          LiquorshopDetailed.route: (context) => LiquorshopDetailed(),
          MedicineShopGrid.route: (context) => MedicineShopGrid(),
          MedicineShopDetailed.route: (context) => MedicineShopDetailed(),
          OrderListingScreen.route: (context) => OrderListingScreen(),
          ProfileScreen.route: (context) => ProfileScreen(),
          UpdateProfileScreen.route: (context) => UpdateProfileScreen(),
          NewPasswordScreen.route: (context) => NewPasswordScreen(),
          PrescriptionUploadScreen.route: (context) =>
              PrescriptionUploadScreen(),
          FavouriteScreen.route: (context) => FavouriteScreen(),
          CartScreen.route: (context) => CartScreen(),
          WalletScreen.route: (context) => WalletScreen(),
          UploadIdentityScreen.route: (context) => UploadIdentityScreen(),
          ProductDetailedScreen.route: (context) => ProductDetailedScreen(),
        },
      ),
    );
  }
}
