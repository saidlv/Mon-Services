import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/dashboard.dart';
import 'package:mon_service/theme/theme.dart';

class SearchSubCategories extends StatefulWidget {
  final int index;
  final String image;
  final String name;
  const SearchSubCategories(
      {Key? key, required this.index, required this.image, required this.name})
      : super(key: key);

  @override
  _SearchSubCategoriesState createState() => _SearchSubCategoriesState();
}

class _SearchSubCategoriesState extends State<SearchSubCategories> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.index;
    setState(() {});
    super.initState();
  }

  List<dynamic> subcategoriesList = [
    'Vacuum Cleaner',
    'Television',
    'Phone repair',
    'Socket Installation and connection',
    'Washing Machine',
    'Microwave',
    'Stove',
    'Rice cooker',
    'Electrical Wiring installation',
    'Treadmill',
    'Smart toilet repair',
    'Air conditioner repair'
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          bottomNavigationBar: bottomNavigationBar(screenWidth),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
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
            title: text('Categories', screenWidth * 5, theme.mainColor,
                fontWeight: FontWeight.w700),
            actions: [
              SizedBox(
                height: screenWidth * 4.5,
                width: screenWidth * 4.5,
                child: Image.asset(
                  'assets/filter.png',
                  color: theme.darkTextColor,
                ),
              ),
              SizedBox(width: screenWidth * 4)
            ],
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidth * 5,
                  ),
                  SizedBox(
                    height: screenWidth * 10,
                    child: Image.asset('assets/${widget.image}'),
                  ),
                  SizedBox(
                    height: screenWidth * 3,
                  ),
                  text(widget.name, screenWidth * 4, theme.lightTextColor,
                      fontWeight: FontWeight.w700),
                  SizedBox(
                    height: screenWidth * 7,
                  ),
                  for (int i = 0; i < subcategoriesList.length; i++)
                    Container(
                      height: screenWidth * 11,
                      color: theme.appBackgroundColor,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(subcategoriesList[i], screenWidth * 4,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w500),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: theme.lightTextColor,
                              size: screenWidth * 4,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }

  Widget sellersList(screenWidth) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            padding: EdgeInsets.only(top: screenWidth * 93),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 4, vertical: screenWidth * 1.5),
                height: screenWidth * 35,
                width: double.infinity,
                decoration: BoxDecoration(
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
