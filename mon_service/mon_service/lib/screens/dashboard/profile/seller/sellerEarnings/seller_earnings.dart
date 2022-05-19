import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';

import 'package:mon_service/theme/theme.dart';

import '../../../dashboard.dart';

class SellerEarnings extends StatefulWidget {
  final int selectedIndex;

  SellerEarnings({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _SellerEarningsState createState() => _SellerEarningsState();
}

class _SellerEarningsState extends State<SellerEarnings> {
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
                    analytics(screenWidth),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                    orders(screenWidth)
                  ],
                ),
              ),
            )));
  }

  AppBar appBar(screenWidth) {
    return AppBar(
      toolbarHeight: screenWidth * 40,
      elevation: 0,
      backgroundColor: theme.mainColor,
      automaticallyImplyLeading: false,
      title: SizedBox(
        height: screenWidth * 33,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: screenWidth * 5,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 3,
                ),
                text('Earnings', screenWidth * 5, Colors.white,
                    fontWeight: FontWeight.w700),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text('\$1248.99', screenWidth * 6, Colors.white,
                    fontWeight: FontWeight.w700),
                text('Total Earnings', screenWidth * 3, Colors.white,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget analytics(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text('Analytics', screenWidth * 4.5, theme.mainColor,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: screenWidth * 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(bottom: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                  'Earnings this month', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('\$80', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(bottom: screenWidth * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Avg. Selling Price', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('\$90', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        )
      ],
    );
  }

  Widget orders(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text('Orders', screenWidth * 4.5, theme.mainColor,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: screenWidth * 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(bottom: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Total Orders', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('80', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(bottom: screenWidth * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Completed Orders', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('45', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(bottom: screenWidth * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Cancelled Orders', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('0', screenWidth * 3.3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        )
      ],
    );
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
