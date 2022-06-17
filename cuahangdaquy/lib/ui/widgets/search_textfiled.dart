import 'package:fast_cart/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: TextField(
        decoration: new InputDecoration(
            focusColor: appColorPrimary,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            border: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            suffixIcon: Icon(Icons.search_rounded),
            hintStyle: new TextStyle(color: Colors.grey[800]),
            hintText: "Search",
            fillColor: Colors.white10),
      ),
    );
  }
}
