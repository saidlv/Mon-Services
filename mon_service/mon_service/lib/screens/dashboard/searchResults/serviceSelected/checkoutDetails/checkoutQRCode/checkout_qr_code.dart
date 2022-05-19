import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/checkoutDetails/checkoutEditCard/checkout_edit_card.dart';
import 'package:mon_service/theme/theme.dart';

class CheckoutQRCode extends StatefulWidget {
  @override
  _CheckoutQRCodeState createState() => _CheckoutQRCodeState();
}

class _CheckoutQRCodeState extends State<CheckoutQRCode> {
  bool isScanned = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: theme.mainColor,
                  size: screenWidth * 5,
                ),
              ),
              title: text('Checkout', screenWidth * 5, theme.mainColor,
                  fontWeight: FontWeight.w700)),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 4),
                        child: text('Oct 6,2020', screenWidth * 2.8,
                            theme.lightTextColor.withOpacity(.7),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: screenWidth * 3),
                              height: screenWidth * 6,
                              width: screenWidth * 6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: theme.lightTextColor
                                          .withOpacity(.4))),
                              child: Container(
                                margin: EdgeInsets.all(screenWidth),
                                height: screenWidth * 6,
                                width: screenWidth * 6,
                                decoration: BoxDecoration(
                                  color: theme.mainColor,
                                  shape: BoxShape.circle,
                                ),
                              )),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: theme.mainColor,
                            ),
                          ),
                          Container(
                              height: screenWidth * 6,
                              width: screenWidth * 6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: theme.lightTextColor
                                          .withOpacity(.4))),
                              child: Container(
                                margin: EdgeInsets.all(screenWidth),
                                height: screenWidth * 6,
                                width: screenWidth * 6,
                                decoration: BoxDecoration(
                                  color: theme.mainColor,
                                  shape: BoxShape.circle,
                                ),
                              )),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: theme.mainColor,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: screenWidth * 4),
                              height: screenWidth * 6,
                              width: screenWidth * 6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: theme.mainColor)),
                              child: Container(
                                margin: EdgeInsets.all(screenWidth),
                                height: screenWidth * 6,
                                width: screenWidth * 6,
                                decoration: BoxDecoration(
                                  color: theme.mainColor,
                                  shape: BoxShape.circle,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text('Delivery', screenWidth * 3.5,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w500),
                          text(
                              'Address', screenWidth * 3.5, theme.darkTextColor,
                              fontWeight: FontWeight.w500),
                          text('Payments', screenWidth * 3.5,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    )
                  ],
                ),
                !isScanned
                    ? SizedBox(
                        height: screenWidth * 60,
                        width: double.infinity,
                        child: Image.asset('assets/qr_code.png'),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text('Checkout Complete', screenWidth * 6,
                                theme.mainColor,
                                fontWeight: FontWeight.w700),
                            SizedBox(
                              height: screenWidth * 3,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green.shade300,
                              size: screenWidth * 20,
                            )
                          ],
                        ),
                      ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isScanned) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckoutEditCard()));
                      }
                      isScanned = true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 4),
                    height: screenWidth * 12.5,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.mainColor,
                      borderRadius: BorderRadius.circular(screenWidth * 100),
                    ),
                    child: Text(
                      isScanned ? 'Done' : 'Scan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: theme.whiteColor,
                          fontSize: screenWidth * 4,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
