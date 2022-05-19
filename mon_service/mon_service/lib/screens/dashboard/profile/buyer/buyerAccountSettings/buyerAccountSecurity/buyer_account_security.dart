import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

import '../../../../dashboard.dart';

class BuyerAccountSecurity extends StatefulWidget {
  final int selectedIndex;

  BuyerAccountSecurity({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _BuyerAccountSecurityState createState() => _BuyerAccountSecurityState();
}

class _BuyerAccountSecurityState extends State<BuyerAccountSecurity> {
  bool multiFactorAuthentication = false;
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(screenWidth),
            backgroundColor: theme.appBackgroundColor,
            bottomNavigationBar: bottomNavigationBar(screenWidth),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenWidth * 8,
                    ),
                    multiFactorAuthenticationBlock(screenWidth),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/phone.png',
                          height: screenWidth * 11,
                          width: screenWidth * 11,
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text('This device(dummy name)', screenWidth * 3,
                                theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .2,
                            ),
                            text('Android', screenWidth * 2.7,
                                theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .2,
                            ),
                            text('London', screenWidth * 2.7,
                                theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/phone.png',
                          height: screenWidth * 11,
                          width: screenWidth * 11,
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text('Second device', screenWidth * 3,
                                theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .2,
                            ),
                            text('Android', screenWidth * 2.7,
                                theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .2,
                            ),
                            text('London', screenWidth * 2.7,
                                theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    signoutFromAllDevicesButton(screenWidth),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget multiFactorAuthenticationBlock(screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text('Multi Factor Authentication', screenWidth * 3.6,
            theme.lightTextColor,
            fontWeight: FontWeight.w600),
        GestureDetector(
          onTap: () {
            setState(() {
              multiFactorAuthentication = !multiFactorAuthentication;
            });
          },
          child: SizedBox(
            height: screenWidth * 5,
            width: screenWidth * 8,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenWidth),
                  decoration: BoxDecoration(
                      color: multiFactorAuthentication
                          ? theme.mainColor.withOpacity(.7)
                          : theme.lightTextColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(screenWidth * 40)),
                ),
                Align(
                  alignment: multiFactorAuthentication
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: screenWidth * 5,
                    decoration: BoxDecoration(
                        color: multiFactorAuthentication
                            ? theme.mainColor
                            : theme.lightTextColor,
                        borderRadius: BorderRadius.circular(screenWidth * 40)),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget signoutFromAllDevicesButton(screenWidth) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => CheckoutDetails()));
            },
            child: Container(
              height: screenWidth * 12.5,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: screenWidth * 8),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 8),
              decoration: BoxDecoration(
                color: theme.mainColor,
                borderRadius: BorderRadius.circular(screenWidth * 100),
              ),
              child: Text(
                'Signout from All Devices',
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
    );
  }

  AppBar appBar(screenWidth) {
    return AppBar(
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
        title: text('Security', screenWidth * 5, theme.mainColor,
            fontWeight: FontWeight.w700));
  }

  Widget bottomNavigationBar(screenWidth) {
    return SizedBox(
      height: screenWidth * 14,
      child: BottomNavigationBar(
          selectedFontSize: 0,
          // unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Dashboard(index: _selectedIndex)));
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.blueColor,
          unselectedItemColor: Colors.grey.shade500,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/home.png',
                    color: _selectedIndex == 0
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/chat.png',
                    color: _selectedIndex == 1
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/search.png',
                    color: _selectedIndex == 2
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/notification.png',
                    color: _selectedIndex == 3
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/person.png',
                    color: _selectedIndex == 4
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
          ]),
    );
  }
}
