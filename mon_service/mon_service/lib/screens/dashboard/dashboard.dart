import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/chat/chatInbox/chat_inbox.dart';
import 'package:mon_service/screens/dashboard/filters/filters.dart';
import 'package:mon_service/screens/dashboard/home/home.dart';
import 'package:mon_service/screens/dashboard/notifications/notifications.dart';
import 'package:mon_service/screens/dashboard/profile/buyer/buyerAccountSettings/buyer_account_settings.dart';

import 'package:mon_service/screens/dashboard/profile/profile.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerAccountSettings/sellerAccountNotifications/seller_account_notifications.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerAccountSettings/seller_account_settings.dart';
import 'package:mon_service/screens/dashboard/searchCategories/search_categories.dart';
import 'package:mon_service/screens/dashboard/searchResults/search_results.dart';
import 'package:mon_service/screens/dashboard/sellerDashboardContent/sellerHome/seller_home.dart';
import 'package:mon_service/screens/dashboard/sellerDashboardContent/sellerNotifications/seller_notifications.dart';
import 'package:mon_service/screens/dashboard/sellerDashboardContent/sellerOrders/seller_orders.dart';
import 'package:mon_service/theme/theme.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final int index;

  const Dashboard({Key? key, required this.index}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.index;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provData = Provider.of<stateSettingProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: _selectedIndex == 4 ? true : false,
        backgroundColor: theme.appBackgroundColor,
        bottomNavigationBar: bottomNavigationBar(screenWidth, provData),
        appBar: _selectedIndex == 1 || _selectedIndex == 3
            ? AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: text(_selectedIndex == 1 ? 'Inbox' : 'Notifications',
                    screenWidth * 5, theme.mainColor,
                    fontWeight: FontWeight.w700),
                actions: [
                  _selectedIndex != 3
                      ? SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: screenWidth * 4),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: screenWidth * 1.5,
                                  horizontal: screenWidth * 2.2),
                              decoration: BoxDecoration(
                                  color: theme.mainColor,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 80)),
                              child: text('Mark all as seen', screenWidth * 2.8,
                                  Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                ],
              )
            : _selectedIndex == 4
                ? AppBar(
                    toolbarHeight: screenWidth * 30,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    // leading: GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Icon(
                    //     Icons.arrow_back_ios,
                    //     color: Colors.white,
                    //     size: screenWidth * 5,
                    //   ),
                    // ),
                    title: Row(
                      children: [
                        Container(
                          height: screenWidth * 17,
                          width: screenWidth * 17,
                          margin: EdgeInsets.only(right: screenWidth * 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.appBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  color: theme.lightTextColor.withOpacity(.3),
                                  offset: Offset(1, 1),
                                  blurRadius: 4)
                            ],
                          ),
                          child: Container(
                            margin: EdgeInsets.all(screenWidth * .5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.darkTextColor,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/person_image.png')),
                            ),
                          ),
                        ),
                        text('Scott Adkins', screenWidth * 5, Colors.white,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          !provData.isSellerMode
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BuyerAccountSettings(
                                      selectedIndex: _selectedIndex)))
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SellerAccountSettings(
                                      selectedIndex: _selectedIndex)));
                        },
                        child: SizedBox(
                          height: screenWidth * 4.5,
                          width: screenWidth * 4.5,
                          child: Image.asset(
                            'assets/settings.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 4)
                    ],
                  )
                : _selectedIndex == 0 && provData.isSellerMode
                    ? AppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        title: text('Scott Adkins', screenWidth * 5,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w700),
                        actions: [
                          Container(
                            margin: EdgeInsets.only(right: screenWidth * 4),
                            height: screenWidth * 8,
                            width: screenWidth * 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/person_image.png'))),
                          )
                        ],
                      )
                    : (_selectedIndex == 2 && !provData.isSellerMode) ||
                            (_selectedIndex == 0 && !provData.isSellerMode)
                        ? AppBar(
                            toolbarHeight: screenWidth * 30,
                            automaticallyImplyLeading: false,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            title: SizedBox(
                              height: screenWidth * 40,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: screenWidth * 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        text('Mon Service', screenWidth * 5,
                                            theme.mainColor,
                                            fontWeight: FontWeight.w700),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Filters()));
                                          },
                                          child: SizedBox(
                                            height: screenWidth * 4.5,
                                            width: screenWidth * 4.5,
                                            child: Image.asset(
                                              'assets/filter.png',
                                              color: theme.darkTextColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenWidth * 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: theme.boxShadow,
                                        color: theme.appBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: TextField(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchResults(
                                                      index: _selectedIndex,
                                                    )));
                                      },
                                      style: textStyle(
                                        fontSize: screenWidth * 3.4,
                                        color: theme.darkTextColor,
                                      ),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: screenWidth * 4),
                                          border: InputBorder.none,
                                          hintText: 'Search a Service',
                                          hintStyle: textStyle(
                                            fontSize: screenWidth * 3.4,
                                            color: theme.lightTextColor,
                                          ),
                                          suffixIconConstraints: BoxConstraints(
                                              minWidth: screenWidth * 10),
                                          suffixIcon: Icon(
                                            Icons.search,
                                            size: screenWidth * 5.5,
                                            color: theme.lightTextColor,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : AppBar(
                            automaticallyImplyLeading: false,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            title: text(
                                'Orders', screenWidth * 5, theme.mainColor,
                                fontWeight: FontWeight.w700),
                          ),
        body: _selectedIndex == 0 && provData.isSellerMode
            ? SellerHome(selectedIndex: _selectedIndex)
            : _selectedIndex == 0 && !provData.isSellerMode
                ? Home()
                : _selectedIndex == 1
                    ? ChatInbox(selectedIndex: _selectedIndex)
                    : _selectedIndex == 2 && provData.isSellerMode
                        ? SellerOrders(selectedIndex: _selectedIndex)
                        : _selectedIndex == 2 && !provData.isSellerMode
                            ? SearchCategories(
                                selectedIndex: _selectedIndex,
                              )
                            : _selectedIndex == 3 && provData.isSellerMode
                                ? SellerNotifications(
                                    selectedIndex: _selectedIndex)
                                : _selectedIndex == 3 && !provData.isSellerMode
                                    ? Notifications(
                                        selectedIndex: _selectedIndex)
                                    : _selectedIndex == 4
                                        ? Profile(selectedIndex: _selectedIndex)
                                        : SizedBox(),
      ),
    );
  }

  Widget bottomNavigationBar(screenWidth, stateSettingProvider provdata) {
    return SizedBox(
      height: screenWidth * 14,
      child: BottomNavigationBar(
          selectedFontSize: 0,
          // unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
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
                    provdata.isSellerMode
                        ? 'assets/policy.png'
                        : 'assets/search.png',
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
