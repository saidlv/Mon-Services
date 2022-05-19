import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';
import '../../../../dashboard.dart';
import 'language_selection_drop_down.dart';

class SellerAccountLanguage extends StatefulWidget {
  final int selectedIndex;

  SellerAccountLanguage({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _SellerAccountLanguageState createState() => _SellerAccountLanguageState();
}

class _SellerAccountLanguageState extends State<SellerAccountLanguage> {
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
                      height: screenWidth * 10,
                    ),
                    languageSelectionDropDown(),
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
        title: text('Language', screenWidth * 5, theme.mainColor,
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
