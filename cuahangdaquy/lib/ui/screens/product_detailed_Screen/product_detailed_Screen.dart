import 'package:fast_cart/constants/AppConstant.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/bottombar.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/material.dart';

class ProductDetailedScreen extends StatefulWidget {
  static const route = '/ProductDetailedScreen';

  String imageUrl;

  String itemName, shopName, itemAbout, rating, quantity, appBarTitle;

  ProductDetailedScreen(
      {this.imageUrl,
      this.itemName,
      this.shopName,
      this.itemAbout,
      this.rating,
      this.appBarTitle,
      this.quantity});

  @override
  _ProductDetailedScreenState createState() => _ProductDetailedScreenState();
}

class _ProductDetailedScreenState extends State<ProductDetailedScreen> {
  List<String> _deliveryMode = [
    'Home Delivery',
    'COD',
  ];
  List<String> _quantity = [
    '1 kg',
    '2 kg',
    '3 kg',
  ];
  String initialQuantity = '1 kg';
  String filterDownValue = 'Home Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarForDetailedScreen(
              height: SizeConfig.blockSizeHorizontal * 40,
              text: 'Grocery',
            ),
            SizedBox(
              height: 20,
            ),
            shopImage(),
            shopAboutSection(),
            quantityButtons(),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabs(
        index: 0,
      ),
    );
  }

  shopImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        burgerImage,
        height: SizeConfig.blockSizeHorizontal * 45,
        width: SizeConfig.screenWidth * 0.9,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  shopAboutSection() {
    return Column(
      children: [
        Container(
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
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                LoremText,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 3,
                color: appTextColor,
              ),
              SizedBox(
                height: 10,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Delivery Mode    ',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          child: DropdownButtonFormField(
                            hint: Text('Select Mode'),
                            iconSize: 20,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal * 4),
                            items: _deliveryMode.map((String filter) {
                              return new DropdownMenuItem(
                                value: filter,
                                child: Text(filter),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // do other stuff with _deliveryMode
                              setState(() => filterDownValue = newValue);
                            },
                            value: filterDownValue,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Quantity',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          child: DropdownButtonFormField(
                            hint: Text('Select Qty'),
                            iconSize: 20,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal * 4),
                            items: _quantity.map((String quantity) {
                              return new DropdownMenuItem(
                                value: quantity,
                                child: Text(quantity),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // do other stuff with _deliveryMode
                              setState(() => initialQuantity = newValue);
                            },
                            value: initialQuantity,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: appColorPrimary),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  quantityButtons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: appColorPrimary,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '5',
                style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 6),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: appColorPrimary,
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'Add to Cart: \$200',
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: appColorPrimary,
            ),
          )
        ],
      ),
    );
  }
}
