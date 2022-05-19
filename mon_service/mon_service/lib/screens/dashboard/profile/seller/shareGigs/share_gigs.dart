import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';

import 'package:mon_service/theme/theme.dart';

import '../../../dashboard.dart';

class ShareGigs extends StatefulWidget {
  final int selectedIndex;

  ShareGigs({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _ShareGigsState createState() => _ShareGigsState();
}

class _ShareGigsState extends State<ShareGigs> {
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
                      height: screenWidth * 5,
                    ),
                    for (int i = 0; i < 10; i++)
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: screenWidth * 1.5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: theme.boxShadow,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 3),
                              color: theme.mainColor),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: screenWidth * 33,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(screenWidth * 3),
                                    child: Image.asset(
                                      'assets/person_image2.png',
                                      height: screenWidth * 27,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(screenWidth * 2)
                                    .copyWith(left: screenWidth * 2),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                        'Plumbing Issues, Leaks and other problems solutions',
                                        screenWidth * 2.8,
                                        Colors.white,
                                        fontWeight: FontWeight.w500),
                                    SizedBox(
                                      height: screenWidth * 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                height: screenWidth * 4,
                                                width: screenWidth * 4,
                                                child: Image.asset(
                                                  'assets/share.png',
                                                  color: Colors.white,
                                                )),
                                            SizedBox(
                                              width: screenWidth * 1.5,
                                            ),
                                            text('Share', screenWidth * 3.5,
                                                Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                        text('\$29', screenWidth * 5,
                                            Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: screenWidth * 8,
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
      title: text('Share Gigs', screenWidth * 5, theme.mainColor,
          fontWeight: FontWeight.w700),
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
