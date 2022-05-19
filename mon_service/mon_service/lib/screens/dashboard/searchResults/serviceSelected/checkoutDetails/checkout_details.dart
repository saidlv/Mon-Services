import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:mon_service/theme/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'checkoutQRCode/checkout_qr_code.dart';

class CheckoutDetails extends StatefulWidget {
  @override
  _CheckoutDetailsState createState() => _CheckoutDetailsState();
}

class _CheckoutDetailsState extends State<CheckoutDetails> {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth * 5,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 4,
                        vertical: screenWidth * 1.5),
                    height: screenWidth * 35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: theme.boxShadow,
                        borderRadius: BorderRadius.circular(screenWidth * 3),
                        color: theme.appBackgroundColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 3),
                          child: SizedBox(
                              width: screenWidth * 33,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 3),
                                child: Image.asset(
                                  'assets/person_image2.png',
                                  height: screenWidth * 35,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(screenWidth * 3)
                              .copyWith(left: screenWidth),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenWidth,
                                  ),
                                  text('Do professional ui ux for websites',
                                      screenWidth * 3.5, theme.darkTextColor,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    height: screenWidth,
                                  ),
                                  text('Oct 6 2020', screenWidth * 2.6,
                                      theme.lightTextColor,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: screenWidth * 2,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: screenWidth * 7,
                                        width: screenWidth * 7,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/person_image2.png'))),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 1.5,
                                      ),
                                      text('Test user', screenWidth * 2.9,
                                          theme.darkTextColor,
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: text('New', screenWidth * 2.9,
                                        Colors.green.shade600,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth * 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Order Price', screenWidth * 4.2,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$65', screenWidth * 4.2, theme.darkTextColor,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Service Charge', screenWidth * 4.2,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$6', screenWidth * 4.2, theme.darkTextColor,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Tax', screenWidth * 4.2, theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$5', screenWidth * 4.2, theme.darkTextColor,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(top: screenWidth, bottom: screenWidth * 4),
                    child: text('Contact Information', screenWidth * 4.8,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 2),
                    decoration: BoxDecoration(
                        color: theme.textFieldColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      style: textStyle(
                        fontSize: screenWidth * 3.4,
                        color: theme.darkTextColor,
                      ),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: screenWidth * 4),
                          border: InputBorder.none,
                          hintText: 'Home Address',
                          hintStyle: textStyle(
                            fontSize: screenWidth * 3.4,
                            color: theme.lightTextColor,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: screenWidth * 10),
                          prefixIcon: Icon(
                            Icons.home,
                            size: screenWidth * 4.5,
                            color: theme.darkTextColor,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 2),
                    decoration: BoxDecoration(
                        color: theme.textFieldColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      style: textStyle(
                        fontSize: screenWidth * 3.4,
                        color: theme.darkTextColor,
                      ),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: screenWidth * 4),
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: textStyle(
                            fontSize: screenWidth * 3.4,
                            color: theme.lightTextColor,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: screenWidth * 10),
                          prefixIcon: Icon(
                            Icons.phone,
                            size: screenWidth * 4.5,
                            color: theme.darkTextColor,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 2),
                    decoration: BoxDecoration(
                        color: theme.textFieldColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      style: textStyle(
                        fontSize: screenWidth * 3.4,
                        color: theme.darkTextColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: screenWidth * 4),
                        border: InputBorder.none,
                        hintText:
                            'Please Enter Some details of the requirements',
                        hintStyle: textStyle(
                          fontSize: screenWidth * 3.4,
                          color: theme.lightTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 28,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Total', screenWidth * 4.2, theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$100', screenWidth * 4.2, theme.darkTextColor,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutQRCode()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: screenWidth * 12.5,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.mainColor,
                        borderRadius: BorderRadius.circular(screenWidth * 100),
                      ),
                      child: Text(
                        'NEXT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: theme.whiteColor,
                            fontSize: screenWidth * 4,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 2,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
