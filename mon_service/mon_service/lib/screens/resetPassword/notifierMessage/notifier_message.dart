import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/login/login.dart';
import 'package:mon_service/theme/theme.dart';

class NotifierMessage extends StatefulWidget {
  @override
  State<NotifierMessage> createState() => _NotifierMessageState();
}

class _NotifierMessageState extends State<NotifierMessage> {
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
                      SizedBox(
                        height: screenWidth * 20,
                      ),
                      text(
                          'A Password Reset Link Has been Sent to your Registered mobile number. Please Use the link to reset your password',
                          screenWidth * 3.5,
                          theme.darkTextColor,
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: screenWidth * 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
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
                            'Back to Login',
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
