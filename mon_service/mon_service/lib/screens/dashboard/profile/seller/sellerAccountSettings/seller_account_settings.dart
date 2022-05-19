import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerAccountSettings/sellerAccountCredentials/seller_account_credentials.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerAccountSettings/sellerAccountLanguage/seller_account_language.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerAccountSettings/sellerAccountNotifications/seller_account_notifications.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerAccountSettings/sellerAccountSecurity/seller_account_security.dart';

import 'package:mon_service/theme/theme.dart';

import '../../../dashboard.dart';

class SellerAccountSettings extends StatefulWidget {
  final int selectedIndex;

  SellerAccountSettings({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _SellerAccountSettingsState createState() => _SellerAccountSettingsState();
}

class _SellerAccountSettingsState extends State<SellerAccountSettings> {
  bool isUnavailable = false;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(screenWidth),
            bottomNavigationBar: bottomNavigationBar(screenWidth),
            backgroundColor: theme.appBackgroundColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenWidth * 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SellerAccountCredentials(
                                selectedIndex: widget.selectedIndex)));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/account.png',
                            color: theme.mainColor,
                            height: screenWidth * 6,
                            width: screenWidth * 6,
                          ),
                          SizedBox(
                            width: screenWidth * 4,
                          ),
                          text('Account Credentials', screenWidth * 3.5,
                              theme.lightTextColor,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SellerAccountNotifications(
                                selectedIndex: widget.selectedIndex)));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/notifications.png',
                            color: theme.mainColor,
                            height: screenWidth * 6,
                            width: screenWidth * 6,
                          ),
                          SizedBox(
                            width: screenWidth * 4,
                          ),
                          text('Notifications', screenWidth * 3.5,
                              theme.lightTextColor,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SellerAccountSecurity(
                                selectedIndex: widget.selectedIndex)));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/security.png',
                            color: theme.mainColor,
                            height: screenWidth * 6,
                            width: screenWidth * 6,
                          ),
                          SizedBox(
                            width: screenWidth * 4,
                          ),
                          text('Security', screenWidth * 3.5,
                              theme.lightTextColor,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/terms.png',
                          color: theme.mainColor,
                          height: screenWidth * 6,
                          width: screenWidth * 6,
                        ),
                        SizedBox(
                          width: screenWidth * 4,
                        ),
                        text('Terms of Service', screenWidth * 3.5,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/policy.png',
                          color: theme.mainColor,
                          height: screenWidth * 6,
                          width: screenWidth * 6,
                        ),
                        SizedBox(
                          width: screenWidth * 4,
                        ),
                        text('Privacy Policy', screenWidth * 3.5,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/set.png',
                              color: theme.mainColor,
                              height: screenWidth * 6,
                              width: screenWidth * 6,
                            ),
                            SizedBox(
                              width: screenWidth * 4,
                            ),
                            text('Set Yourself as Unavailable',
                                screenWidth * 3.5, theme.lightTextColor,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isUnavailable = !isUnavailable;
                            });
                          },
                          child: SizedBox(
                            height: screenWidth * 5,
                            width: screenWidth * 8,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: screenWidth),
                                  decoration: BoxDecoration(
                                      color: isUnavailable
                                          ? theme.mainColor.withOpacity(.7)
                                          : theme.lightTextColor
                                              .withOpacity(.5),
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 40)),
                                ),
                                Align(
                                  alignment: isUnavailable
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Container(
                                    width: screenWidth * 5,
                                    decoration: BoxDecoration(
                                        color: isUnavailable
                                            ? theme.mainColor
                                            : theme.lightTextColor,
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 40)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SellerAccountLanguage(
                                selectedIndex: widget.selectedIndex)));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/language.png',
                            color: theme.mainColor,
                            height: screenWidth * 6,
                            width: screenWidth * 6,
                          ),
                          SizedBox(
                            width: screenWidth * 4,
                          ),
                          text('language', screenWidth * 3.5,
                              theme.lightTextColor,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/logout.png',
                          color: theme.mainColor,
                          height: screenWidth * 6,
                          width: screenWidth * 6,
                        ),
                        SizedBox(
                          width: screenWidth * 4,
                        ),
                        text('Logout', screenWidth * 3.5, theme.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                  ],
                ),
              ),
            )));
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
        title: text('Account Settings', screenWidth * 5, theme.mainColor,
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
