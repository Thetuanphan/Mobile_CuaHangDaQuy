import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class ProgressAlertMessage extends StatelessWidget {
  static const route = '/ProgressAlertMessage';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      alignment: Alignment.center,
      height: 250,
      padding: EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 10),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0),
                offset: Offset(0, 10),
                blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            LoremText,
            maxLines: 2,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appColorPrimary)),
              onPressed: () {},
              child: Text('Close')),
        ],
      ),
    );
  }
}
