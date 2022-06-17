import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCardForAll extends StatelessWidget {
  String imageUrl, title, subTitle, quantity, route;

  ShopCardForAll(
      {this.imageUrl, this.title, this.subTitle, this.quantity, this.route});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    height: SizeConfig.blockSizeHorizontal * 30,
                    width: SizeConfig.blockSizeHorizontal * 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal * 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 6,
              left: 5,
              child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.blockSizeHorizontal * 7,
                width: SizeConfig.blockSizeHorizontal * 15,
                decoration: BoxDecoration(
                    color: appColorPrimary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomRight: Radius.circular(10))),
                child: Text(
                  quantity,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal * 3),
                ),
              ),
            ),
            Positioned(
              right: -5,
              top: -10,
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border_outlined),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(20),
                    //   bottomLeft: Radius.circular(20),
                    // ),
                    shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
