import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/profile/seller/manageGigs/createNewGig/create_new_gig.dart';

import 'package:mon_service/theme/theme.dart';

import '../../../dashboard.dart';

class ManageGigs extends StatefulWidget {
  final int selectedIndex;

  ManageGigs({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _ManageGigsState createState() => _ManageGigsState();
}

class _ManageGigsState extends State<ManageGigs> {
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateNewGig()));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: screenWidth * 7,
                            width: screenWidth * 7,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: screenWidth * 5,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 2,
                          ),
                          text('Create New Gig', screenWidth * 4,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 3,
                    ),
                    for (int i = 0; i < 4; i++)
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
                                      height: screenWidth * 26,
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
                                            for (int i = 0; i < 5; i++)
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade600,
                                                size: screenWidth * 3,
                                              )
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
      title: text('Manage Gigs', screenWidth * 5, theme.mainColor,
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
