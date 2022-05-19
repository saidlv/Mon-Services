import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/login/login.dart';
import 'package:mon_service/screens/sellerInformation/seller_information.dart';
import 'package:mon_service/theme/theme.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isChecked = false;
  bool isSellerChecked = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.appBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: theme.mainColor,
                    size: screenWidth * 5,
                  )),
            ),
            body: Padding(
              padding:
                  EdgeInsets.all(screenWidth * 6).copyWith(top: 0, bottom: 0),
              child: SizedBox(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: screenWidth * 35,
                          width: double.infinity,
                        ),
                        text('Create an account', screenWidth * 3.5,
                            theme.darkTextColor),
                        SizedBox(
                          height: screenWidth * 12,
                        ),
                        Container(
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
                              hintText: 'Name',
                              hintStyle: textStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 2,
                        ),
                        Container(
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
                              hintText: 'Email',
                              hintStyle: textStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 2,
                        ),
                        Container(
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
                              hintText: 'Password',
                              hintStyle: textStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 2,
                        ),
                        Container(
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
                              hintText: 'Confirm Password',
                              hintStyle: textStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 2),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSellerChecked = !isSellerChecked;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: screenWidth * 4.5,
                                  width: screenWidth * 4.5,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * .9),
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: theme.mainColor,
                                      )),
                                  child: isSellerChecked
                                      ? Icon(
                                          Icons.done,
                                          color: theme.mainColor,
                                          size: screenWidth * 3,
                                        )
                                      : SizedBox(),
                                ),
                                SizedBox(
                                  width: screenWidth * 2,
                                ),
                                text('I want to be a Seller', screenWidth * 3.5,
                                    theme.mainColor,
                                    fontWeight: FontWeight.w600)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SellerInformation()));
                          },
                          child: Container(
                            height: screenWidth * 12.5,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: theme.mainColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 100),
                            ),
                            child: Text(
                              'SIGN UP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.whiteColor,
                                  fontSize: screenWidth * 4,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 2),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: screenWidth * 4.5,
                                  width: screenWidth * 4.5,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * .9),
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: theme.mainColor,
                                      )),
                                  child: isChecked
                                      ? Icon(
                                          Icons.done,
                                          color: theme.mainColor,
                                          size: screenWidth * 3,
                                        )
                                      : SizedBox(),
                                ),
                                SizedBox(
                                  width: screenWidth * 2,
                                ),
                                Flexible(
                                  child: text(
                                      'By creating an account or logging in, you agree to Terms & Conditions and Privacy Policy',
                                      screenWidth * 2.8,
                                      theme.darkTextColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: screenWidth * 9,
                              width: screenWidth * 30,
                              decoration: BoxDecoration(
                                boxShadow: theme.boxShadow,
                                color: theme.appBackgroundColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 100),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/facebook.png',
                                    height: screenWidth * 4,
                                    width: screenWidth * 4,
                                  ),
                                  SizedBox(width: screenWidth * 2),
                                  text('Facebook', screenWidth * 2.8,
                                      theme.darkTextColor,
                                      fontWeight: FontWeight.w500)
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth * 6),
                            Container(
                              height: screenWidth * 9,
                              width: screenWidth * 30,
                              decoration: BoxDecoration(
                                boxShadow: theme.boxShadow,
                                color: theme.appBackgroundColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 100),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/google.png',
                                    height: screenWidth * 4,
                                    width: screenWidth * 4,
                                  ),
                                  SizedBox(width: screenWidth * 2),
                                  text('Google', screenWidth * 2.8,
                                      theme.darkTextColor,
                                      fontWeight: FontWeight.w500)
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                        Container(
                          height: screenWidth * 9,
                          width: screenWidth * 30,
                          decoration: BoxDecoration(
                            boxShadow: theme.boxShadow,
                            color: theme.appBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(screenWidth * 100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/twitter.png',
                                height: screenWidth * 4,
                                width: screenWidth * 4,
                              ),
                              SizedBox(width: screenWidth * 2),
                              text('Twitter', screenWidth * 2.8,
                                  theme.darkTextColor,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text('Already have an account? ', screenWidth * 3,
                                theme.lightTextColor),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login()));
                              },
                              child: text('Login here', screenWidth * 3,
                                  theme.darkTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
