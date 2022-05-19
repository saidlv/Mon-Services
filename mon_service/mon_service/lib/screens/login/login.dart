import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/dashboard.dart';
import 'package:mon_service/screens/registration/registration.dart';
import 'package:mon_service/screens/resetPassword/reset_password.dart';
import 'package:mon_service/theme/theme.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.appBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 4),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResetPassword()));
                    },
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
                        SizedBox(
                          height: screenWidth,
                        ),
                        text('Sign in to Continue', screenWidth * 3,
                            theme.lightTextColor),
                        SizedBox(
                          height: screenWidth * 15,
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
                                hintText: 'Username or Mobile Number',
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
                          height: screenWidth * 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: theme.textFieldColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: TextField(
                            obscureText: isPasswordVisible ? false : true,
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
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: screenWidth * 10),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: screenWidth * 4,
                                  color: theme.darkTextColor,
                                ),
                                suffixIconConstraints:
                                    BoxConstraints(minWidth: screenWidth * 10),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: screenWidth * 4,
                                    color: theme.lightTextColor,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Dashboard(
                                      index: 0,
                                    )));
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
                              'SIGN IN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.whiteColor,
                                  fontSize: screenWidth * 4,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                          },
                          child: text('Forgot Password?', screenWidth * 3,
                              theme.lightTextColor),
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
                          height: screenWidth * 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text('New here? ', screenWidth * 3,
                                theme.lightTextColor),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Registration()));
                              },
                              child: text('Signup here', screenWidth * 3,
                                  theme.darkTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
