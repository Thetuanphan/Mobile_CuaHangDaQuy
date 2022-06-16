import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/dashboard/main_dashboard.dart';
import 'package:fast_cart/ui/widgets/custom_button.dart';
import 'package:fast_cart/ui/widgets/custom_text_filed.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final auth = FirebaseAuth.instance;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userNameFocusNode;
  FocusNode passwordFocusNode;

  String userName, password;

  @override
  void initState() {
    userNameFocusNode = FocusNode();

    passwordFocusNode = FocusNode();

    super.initState();
  }

  void dispose() {
    super.dispose();
    userNameFocusNode.dispose();

    passwordFocusNode.dispose();

    userNameController.dispose();

    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign in',
          style: TextStyle(
              color: appColorPrimary,
              fontWeight: FontWeight.w700,
              fontSize: textSizeLarge),
        ),
        userNameTextField(),
        passwordTextField(),
        SizedBox(
          height: 10,
        ),
        signButton(),
        alreadyHaveAnAccount(),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              socialLoginButton(asset: 'assets/google.png', function: () {}),
              socialLoginButton(asset: 'assets/facebook.jpg', function: () {}),
              socialLoginButton(asset: 'assets/mobile.png', function: () {}),
            ],
          ),
        ),
        singUpLater()
      ],
    );
  }

  userNameTextField() {
    return CustomTextField(
      borderRadius: 30,
      showAssetIcon: true,
      hintText: 'Email',
      iconAsset: 'assets/profile.png',
      textInputType: TextInputType.name,
      textEditingController: userNameController,
      onChanged: (value) {
        setState(() {
          userName = value;
        });
      },
      focusNode: userNameFocusNode,
    );
  }

  passwordTextField() {
    return CustomTextField(
      borderRadius: 30,
      hintText: 'password',
      showAssetIcon: true,
      iconAsset: 'assets/password.png',
      textInputType: TextInputType.visiblePassword,
      textEditingController: passwordController,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      focusNode: passwordFocusNode,
    );
  }

  signButton() {
    return TextButton(
        onPressed: () {
      if (userName != null && password != null) {
        auth.signInWithEmailAndPassword(
            email: userName, password: password);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainDashboard()));
      }
      else{

      }
    },
      child: CustomAppButton(
        title: 'Sign In',
        width: SizeConfig.blockSizeHorizontal * 40,
        padding: SizeConfig.blockSizeHorizontal * 4,
        fontSize: SizeConfig.blockSizeHorizontal * 4,
      )
    );
  }

  alreadyHaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account',
          style: TextStyle(color: appTextColor.withOpacity(0.5)),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign in',
            style: TextStyle(
              fontSize: 15,
              color: appColorPrimary,
            ),
          ),
        ),
      ],
    );
  }

  socialLoginButton({@required String asset, @required Function function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset(
          asset,
          height: SizeConfig.blockSizeHorizontal * 6,
          width: SizeConfig.blockSizeHorizontal * 6,
        ),
      ),
    );
  }

  singUpLater() {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Sign Up Later',
          style: TextStyle(fontWeight: FontWeight.w600, color: appColorPrimary),
        ));
  }
}
