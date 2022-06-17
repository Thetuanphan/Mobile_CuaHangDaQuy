import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  String title;
  Function function;
  double height, width, padding, margin, fontSize;

  CustomAppButton(
      {this.title,
      this.function,
      this.height,
      this.width,
      this.margin,
      this.padding,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding ?? 0),
        margin: EdgeInsets.all(margin ?? 0),
        alignment: Alignment.center,
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
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
