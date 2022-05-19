import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/dashboard.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/service_selected.dart';
import 'package:mon_service/theme/theme.dart';

class SearchResults extends StatefulWidget {
  final int index;
  const SearchResults({Key? key, required this.index}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.index;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          bottomNavigationBar: bottomNavigationBar(screenWidth),
          body: Stack(
            children: [
              sellersList(screenWidth),
              topBar(screenWidth),
            ],
          )),
    );
  }

  Widget topBar(screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      color: theme.appBackgroundColor,
      height: screenWidth * 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: theme.darkTextColor,
                    size: screenWidth * 5,
                  ),
                ),
                SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 3,
          ),
          text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              screenWidth * 3.2,
              theme.darkTextColor,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: screenWidth * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Shop  By', screenWidth * 4.5, theme.darkTextColor,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: screenWidth * 4.5,
                width: screenWidth * 4.5,
                child: Image.asset(
                  'assets/filter.png',
                  color: theme.darkTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenWidth * 4,
          ),
          Row(
            children: [
              Container(
                height: screenWidth * 10,
                width: screenWidth * 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: theme.boxShadow,
                    color: theme.mainColor,
                    borderRadius: BorderRadius.circular(screenWidth * 1.2)),
                child: text('Seller Level', screenWidth * 3, Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: screenWidth * 2,
              ),
              Container(
                height: screenWidth * 10,
                width: screenWidth * 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: theme.boxShadow,
                    color: theme.appBackgroundColor,
                    borderRadius: BorderRadius.circular(screenWidth * 1.2)),
                child: text(
                    'Delivery Time', screenWidth * 3, theme.darkTextColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: screenWidth * 2,
          ),
          Row(
            children: [
              Container(
                height: screenWidth * 26,
                width: screenWidth * 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: theme.boxShadow,
                    color: theme.appBackgroundColor,
                    borderRadius: BorderRadius.circular(screenWidth * 1.2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenWidth * 9,
                      child: Image.asset(
                        'assets/like.png',
                      ),
                    ),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('Top Rated\nSellers', screenWidth * 2.4,
                        theme.lightTextColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 2,
              ),
              Container(
                height: screenWidth * 26,
                width: screenWidth * 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: theme.boxShadow,
                    color: theme.appBackgroundColor,
                    borderRadius: BorderRadius.circular(screenWidth * 1.2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenWidth * 9,
                      child: Image.asset(
                        'assets/badge.png',
                      ),
                    ),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('Level 3\nSellers', screenWidth * 2.4,
                        theme.lightTextColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget sellersList(screenWidth) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            padding: EdgeInsets.only(top: screenWidth * 93),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ServiceSelected(
                          index: _selectedIndex,
                          image: 'person_image2.png',
                          name: 'Scott adkins')));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 4, vertical: screenWidth * 1.5),
                  height: screenWidth * 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: theme.boxShadow,
                      borderRadius: BorderRadius.circular(screenWidth * 3),
                      color: theme.appBackgroundColor),
                  child: Row(
                    children: [
                      SizedBox(
                          width: screenWidth * 37,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(screenWidth * 3),
                                bottomLeft: Radius.circular(screenWidth * 3)),
                            child: Image.asset(
                              'assets/person_image2.png',
                              height: screenWidth * 35,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(screenWidth * 3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                      size: screenWidth * 3.4,
                                    ),
                                    text(' 4.0', screenWidth * 3.2,
                                        Colors.yellow.shade700,
                                        fontWeight: FontWeight.w500),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: text(' (380)', screenWidth * 2.5,
                                          theme.lightTextColor.withOpacity(.8),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Lorem Ipsium', screenWidth * 3.5,
                                    theme.darkTextColor,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text(
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                                    screenWidth * 2.6,
                                    theme.darkTextColor,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: screenWidth * 2,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: text('From 80\$', screenWidth * 3.1,
                                  theme.darkTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }));
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
