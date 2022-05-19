import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

import '../../../../dashboard.dart';

class SellerAccountNotifications extends StatefulWidget {
  final int selectedIndex;

  SellerAccountNotifications({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _SellerAccountNotificationsState createState() =>
      _SellerAccountNotificationsState();
}

class _SellerAccountNotificationsState
    extends State<SellerAccountNotifications> {
  List<dynamic> pushAndEmailNotifications = [
    {'name': 'Order Updates', 'selected': true},
    {'name': 'Order Messages', 'selected': false},
    {'name': 'Inbox Messages', 'selected': false},
    {'name': 'Buyers Requests', 'selected': false},
    {'name': 'My Gigs', 'selected': false},
    {'name': 'My Account', 'selected': false},
    {'name': 'Inbox Messages', 'selected': true},
    {'name': 'Order Messages', 'selected': false},
    {'name': 'Order Updates', 'selected': false},
  ];
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
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: screenWidth * 7,
                          color: theme.lightTextColor,
                        ),
                        SizedBox(
                          width: screenWidth * 2,
                        ),
                        text('Push Notifications', screenWidth * 3.4,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: screenWidth * 1.5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    for (int i = 0; i < 6; i++)
                      details(
                          screenWidth, pushAndEmailNotifications[i]['name'], i),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: screenWidth * 7,
                          color: theme.lightTextColor,
                        ),
                        SizedBox(
                          width: screenWidth * 2,
                        ),
                        text('Email Notifications', screenWidth * 3.4,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: screenWidth * 1.5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    for (int i = 6; i < 9; i++)
                      details(
                          screenWidth, pushAndEmailNotifications[i]['name'], i),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget details(screenWidth, title, index) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 6),
            child: text(title, screenWidth * 3.3, theme.darkTextColor,
                fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pushAndEmailNotifications[index]['selected'] =
                    !pushAndEmailNotifications[index]['selected'];
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
                        color: pushAndEmailNotifications[index]['selected']
                            ? theme.mainColor.withOpacity(.7)
                            : theme.lightTextColor.withOpacity(.3),
                        borderRadius: BorderRadius.circular(screenWidth * 40)),
                  ),
                  Align(
                    alignment: pushAndEmailNotifications[index]['selected']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: screenWidth * 5,
                      decoration: BoxDecoration(
                          color: pushAndEmailNotifications[index]['selected']
                              ? theme.mainColor
                              : theme.lightTextColor,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 40)),
                    ),
                  )
                ],
              ),
            ),
          )
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
        title: text('Notifications', screenWidth * 5, theme.mainColor,
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
