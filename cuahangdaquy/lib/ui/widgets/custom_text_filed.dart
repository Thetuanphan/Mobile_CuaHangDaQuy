import 'package:fast_cart/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  bool autoValidate = false;
  FocusNode focusNode;
  TextEditingController textEditingController;
  Function onChanged;
  Function onSubmited;
  Function validator;
  TextInputType textInputType;
  String hintText;
  String labelText;
  String iconAsset;
  double borderRadius;
  bool showAssetIcon;

  CustomTextField(
      {@required this.autoValidate,
      @required this.focusNode,
      @required this.textEditingController,
      @required this.onChanged,
      @required this.onSubmited,
      @required this.validator,
      this.borderRadius,
      @required this.showAssetIcon,
      @required this.textInputType,
      @required this.hintText,
      this.iconAsset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: TextFormField(
        keyboardType: textInputType ?? TextInputType.number,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        controller: textEditingController,
        validator: validator,
        onChanged: onChanged,
        style: TextStyle(color: appTextColor),
        decoration: InputDecoration(
          filled: true,
          prefixIcon: showAssetIcon
              ? IconButton(
                  icon: new Image.asset(
                    iconAsset,
                    width: 20.0,
                    height: 20.0,
                  ),
                  onPressed: null,
                )
              : Container(),

          hintStyle: TextStyle(color: appTextColor.withOpacity(0.5)),
          hintText: hintText,
          fillColor: lightGrey.withOpacity(0.4),
          contentPadding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //       color: Color(0XFFFF5379), style: BorderStyle.solid, width: 1.0),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //       color: Color(0XFFFF5379), style: BorderStyle.solid, width: 1.0),
          // ),
        ),
        onFieldSubmitted: onSubmited,
        cursorColor: Colors.white,
      ),
    );
  }
}
