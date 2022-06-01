import 'package:expandable/expandable.dart';
import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/screens/liquor/liquor_grid.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadIdentityScreen extends StatefulWidget {
  static const route = '/UploadIdentityScreen';

  @override
  _UploadIdentityScreenState createState() => _UploadIdentityScreenState();
}

class _UploadIdentityScreenState extends State<UploadIdentityScreen> {
  List<String> _filters = ['Aadhaar Card', 'Voter Card', 'Driving License'];
  String filterDownValue = 'Aadhaar Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: BackButton(
                color: appColorPrimary,
              ),
              title: Text(
                'Restrictions',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Select the Govt. ID to upload',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  dropDownForIdentity(),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Upload Document',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  couponTextField(),
                  couponTextField(),
                  couponTextField(),
                  SizedBox(
                    height: 10,
                  ),
                  nextStepCard(),
                  idCaptureTip(),
                  SizedBox(
                    height: 10,
                  ),
                  selfieTip(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  dropDownForIdentity() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
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
      alignment: Alignment.center,
      height: SizeConfig.blockSizeHorizontal * 12,
      child: DropdownButtonFormField(
        hint: Text('Filters..'),
        iconSize: 0,
        items: _filters.map((String filter) {
          return DropdownMenuItem(
            value: filter,
            child: Text(
              filter,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 3.8,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          // do other stuff with _filters
          setState(() => filterDownValue = newValue);
        },
        value: filterDownValue,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
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
            suffixIcon: Icon(
              Icons.arrow_drop_down_rounded,
              color: appColorPrimary,
              size: 30,
            )),
      ),
    );
  }

  nextStepCard() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
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
        children: [
          Text(
            'NEXT STEPS FOR VERIFICATION',
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 3,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/step1.png',
                height: SizeConfig.blockSizeHorizontal * 5,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Upload a photo of the selected Goct. ID\nto verify you age.',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/camera.png',
                height: SizeConfig.blockSizeHorizontal * 5,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Upload a selfie to ensure that the ID is yours.',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  idCaptureTip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
      child: ExpandablePanel(
          header: Text(
            'ID Capture Tips',
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
            ),
          ),
          expanded: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/id check 1.png',
                    height: SizeConfig.blockSizeHorizontal * 13,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Avoid Blurry\nphotos of id',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/flash tip.png',
                    height: SizeConfig.blockSizeHorizontal * 13,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Avoid Photo\nglare',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  selfieTip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
      child: ExpandablePanel(
          header: Text(
            'Selfie Capture Tips',
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
            ),
          ),
          expanded: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Look at the Camera and click',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.2,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Look at the Camera and click',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.2,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/tip1.png',
                          height: SizeConfig.blockSizeHorizontal * 13,
                        ),
                        Text(
                          'Bright Light',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset(
                            'assets/tip 2.png',
                            height: SizeConfig.blockSizeHorizontal * 6,
                          ),
                        ),
                        Text(
                          'No Glasses',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/tip 3.png',
                          height: SizeConfig.blockSizeHorizontal * 10,
                        ),
                        Text(
                          'No cap',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  bottomNavButton() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, LiquorGridScreen.route);
        },
        child: Text('Start One-Time Verification'),
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
          backgroundColor: MaterialStateProperty.all(appColorPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }

  couponTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          width: SizeConfig.screenWidth * 0.5,
          height: SizeConfig.blockSizeVertical * 5,
          margin: EdgeInsets.symmetric(vertical: 15),
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: 'Upload Front Size',
              filled: true,
              fillColor: Colors.white,
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
        Container(
          width: SizeConfig.blockSizeVertical * 15,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: appColorPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Upload',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeHorizontal * 4.5),
          ),
        ),
      ],
    );
  }
}
