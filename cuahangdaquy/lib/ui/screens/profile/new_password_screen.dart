import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/ui/widgets/custom_text_filed.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  static const route = '/NewPasswordScreen';

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode oldPasswordFocusNode;

  FocusNode newPasswordFocusNode;

  FocusNode confirmPasswordFocusNode;

  String oldPassword, newPassword, confirmPassword;

  @override
  void initState() {
    oldPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    super.initState();
  }

  void dispose() {
    super.dispose();
    oldPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarForDetailedScreen(
            height: SizeConfig.blockSizeHorizontal * 40,
            text: 'New Password',
          ),
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
                  'Change Password',
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
                oldTextField(),
                newTextField(),
                confirmTextField(),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'Change Password',
              style: TextStyle(color: Colors.white),
            ),
            color: appColorPrimary,
          )
        ],
      ),
    );
  }

  oldTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'Old Password',
      iconAsset: 'assets/password.png',
      textInputType: TextInputType.name,
      textEditingController: oldPasswordController,
      onChanged: (value) {
        setState(() {
          oldPassword = value;
        });
      },
    );
  }

  newTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'New Password',
      iconAsset: 'assets/password.png',
      textInputType: TextInputType.name,
      textEditingController: newPasswordController,
      focusNode: newPasswordFocusNode,
      onChanged: (value) {
        setState(() {
          newPassword = value;
        });
      },
    );
  }

  confirmTextField() {
    return CustomTextField(
      showAssetIcon: true,
      borderRadius: 30,
      hintText: 'Confirm Password',
      iconAsset: 'assets/profile.png',
      textInputType: TextInputType.name,
      textEditingController: confirmPasswordController,
      focusNode: confirmPasswordFocusNode,
      onChanged: (value) {
        setState(() {
          confirmPassword = value;
        });
      },
    );
  }
}
