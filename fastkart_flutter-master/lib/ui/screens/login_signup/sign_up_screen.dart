import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/custom_button.dart';
import 'package:fast_cart/ui/widgets/custom_text_filed.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  FocusNode nameFocusNode;
  FocusNode userNameFocusNode;
  FocusNode emailFocusNode;
  FocusNode phoneFocusNode;
  FocusNode passwordFocusNode;
  FocusNode dobFocusNode;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isloading = false;
  bool autoValidate = false;

  @override
  void initState() {
    nameFocusNode = FocusNode();
    userNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    dobFocusNode = FocusNode();

    super.initState();
  }

  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    dobFocusNode.dispose();

    nameController.dispose();

    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    dobController.dispose();
  }

  String name;
  String userName;
  String password;
  String dob;
  String phone;
  String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
              color: appColorPrimary,
              fontWeight: FontWeight.w700,
              fontSize: textSizeLarge),
        ),
        nameTextField(),
        userNameTextField(),
        passwordTextField(),
        PhoneTextField(),
        dobTextField(),
        SizedBox(
          height: 10,
        ),
        signButton(),
        alreadyHaveAnAccount(),
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
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'User Name',
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

  nameTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'Full Name',
      iconAsset: 'assets/profile.png',
      textInputType: TextInputType.name,
      textEditingController: nameController,
      onChanged: (value) {
        setState(() {
          name = value;
        });
      },
    );
  }

  PhoneTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'Phone',
      iconAsset: 'assets/mobile.png',
      textInputType: TextInputType.name,
      textEditingController: phoneController,
      onChanged: (value) {
        setState(() {
          phone = value;
        });
      },
    );
  }

  passwordTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'password',
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

  dobTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'D.O.B',
      iconAsset: 'assets/calendar.png',
      textInputType: TextInputType.visiblePassword,
      textEditingController: dobController,
      onChanged: (value) {
        setState(() {
          dob = value;
        });
      },
      focusNode: dobFocusNode,
    );
  }

  signButton() {
    return CustomAppButton(
      title: 'Sign Up Now',
      width: SizeConfig.blockSizeHorizontal * 40,
      padding: SizeConfig.blockSizeHorizontal * 4,
      fontSize: SizeConfig.blockSizeHorizontal * 4,
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
