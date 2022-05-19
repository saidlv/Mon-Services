import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

class SellerInformation extends StatefulWidget {
  @override
  State<SellerInformation> createState() => _SellerInformationState();
}

class _SellerInformationState extends State<SellerInformation> {
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenWidth * 7),
                      Image.asset(
                        'assets/logo.png',
                        height: screenWidth * 35,
                        width: double.infinity,
                      ),
                      text('Seller Information', screenWidth * 3.5,
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: screenWidth * 4),
                            border: InputBorder.none,
                            hintText: 'Phone',
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
                            hintText: 'Address',
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: screenWidth * 4),
                            border: InputBorder.none,
                            hintText: 'Registration Number',
                            hintStyle: textStyle(
                              fontSize: screenWidth * 3.4,
                              color: theme.lightTextColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => EmailCheck()));
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
                            'BECOME A SELLER',
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
                ),
              ),
            )));
  }
}
