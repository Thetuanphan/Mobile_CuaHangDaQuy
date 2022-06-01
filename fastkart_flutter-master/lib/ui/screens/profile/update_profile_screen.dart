import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/profile/new_password_screen.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/ui/widgets/custom_text_filed.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const route = '/UpdateProfileScreen';

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarForDetailedScreen(
              height: SizeConfig.blockSizeHorizontal * 40,
              text: 'My Profile',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/edit.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
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
                  nameTextField(),
                  userNameTextField(),
                  PhoneTextField(),
                  dobTextField(),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, NewPasswordScreen.route);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: appColorPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 15),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, NewPasswordScreen.route);
              },
              child: Text(
                'Change Password',
                style: TextStyle(color: Colors.white),
              ),
              color: appColorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 15),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
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
}
