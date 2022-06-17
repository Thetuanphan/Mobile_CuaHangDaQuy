import 'package:fast_cart/constants/colors_constants.dart';
import 'package:fast_cart/ui/widgets/custom_fastcart_appbar.dart';
import 'package:fast_cart/utills/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrescriptionUploadScreen extends StatefulWidget {
  static const route = '/PrescriptionUploadScreen';

  @override
  _PrescriptionUploadScreenState createState() =>
      _PrescriptionUploadScreenState();
}

class _PrescriptionUploadScreenState extends State<PrescriptionUploadScreen> {
  TextEditingController messageController = TextEditingController();

  String message;

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainDashBoardAppBar2(
              height: 150,
              text: 'Medicine',
              textfiledIcon: 'assets/pin.png',
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prescription',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: messageTextField(
                                  hintText: 'Upload Prescription',
                                  verticalPadding: 0,
                                  maxLines: 1),
                              width: SizeConfig.blockSizeHorizontal * 40,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Upload'),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appColorPrimary),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.camera_alt),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appColorPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Message',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          child: messageTextField(
                              hintText: 'messages',
                              verticalPadding: 30,
                              maxLines: 5),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            addMedicineandQuantity(),
            SizedBox(
              height: 10,
            ),
            addMedicineandQuantity(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Add'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 15),
                    ),
                    backgroundColor: MaterialStateProperty.all(appColorPrimary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: sendNow(),
    );
  }

  messageTextField({String hintText, double verticalPadding, int maxLines}) {
    return TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      controller: messageController,
      // validator: (value) {},
      onChanged: (value) {},
      style: TextStyle(color: appColorPrimary),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: appTextColor.withOpacity(0.5)),
        hintText: hintText,
        fillColor: lightGrey.withOpacity(0.4),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: new OutlineInputBorder(
          borderSide: BorderSide(color: appColorPrimary, width: 1),
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColorPrimary, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColorPrimary, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      // onFieldSubmitted: (vlue) {},
      cursorColor: appColorPrimary,
    );
  }

  addMedicineandQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: messageTextField(
              hintText: 'Medicine Names', verticalPadding: 0, maxLines: 1),
          width: SizeConfig.blockSizeHorizontal * 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: appColorPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '2',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: appColorPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  sendNow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Send Now'),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal * 5),
          ),
          backgroundColor: MaterialStateProperty.all(appColorPrimary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
