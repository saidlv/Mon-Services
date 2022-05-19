import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/resetPassword/notifierMessage/notifier_message.dart';
import 'package:mon_service/theme/theme.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.appBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 4),
                  child: GestureDetector(
                    onTap: () {},
                    child: text('Continue as a guest', screenWidth * 4,
                        theme.darkTextColor),
                  ),
                ),
                SizedBox(width: screenWidth * 3)
              ],
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
                      text(
                          'Please Enter Your Registered Mobile Number and we will send a Password Reset link',
                          screenWidth * 3.5,
                          theme.darkTextColor,
                          textAlign: TextAlign.center),
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
                              hintText: 'Mobile Number',
                              hintStyle: textStyle(
                                fontSize: screenWidth * 3.4,
                                color: theme.lightTextColor,
                              ),
                              prefixIconConstraints:
                                  BoxConstraints(minWidth: screenWidth * 10),
                              prefixIcon: Icon(
                                Icons.person,
                                size: screenWidth * 4,
                                color: theme.darkTextColor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 9,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotifierMessage()));
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
                            'Reset Password',
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
