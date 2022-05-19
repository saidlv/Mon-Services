import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

class SellerNotifications extends StatefulWidget {
  final int selectedIndex;

  SellerNotifications({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<SellerNotifications> createState() => _SellerNotificationsState();
}

class _SellerNotificationsState extends State<SellerNotifications> {
  List<dynamic> selectedList = [];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Stack(
      children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth * 4,
                  ),
                  todayNotifications(screenWidth),
                  SizedBox(
                    height: screenWidth * 6,
                  ),
                  yesterdayNotifications(screenWidth),
                  SizedBox(
                    height: screenWidth * 6,
                  ),
                  last7DaysNotifications(screenWidth),
                  SizedBox(
                    height: screenWidth * 19,
                  ),
                ],
              ),
            )),
        selectedList.isEmpty
            ? SizedBox()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(screenWidth * 4),
                  height: screenWidth * 14,
                  width: screenWidth * 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: theme.mainColor,
                      borderRadius: BorderRadius.circular(screenWidth)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              todayNotificationsList.removeWhere(
                                  (element) => element['selected']);

                              yesterdayNotificationsList.removeWhere(
                                  (element) => element['selected']);
                              last7DaysNotificationsList.removeWhere(
                                  (element) => element['selected']);
                              selectedList.removeWhere(
                                  (element) => element['selected']);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 5,
                                  width: screenWidth * 5,
                                  child: Image.asset('assets/delete.png'),
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Delete', screenWidth * 2.5, Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 5,
                                  width: screenWidth * 5,
                                  child: Image.asset('assets/done.png'),
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Mark as seen', screenWidth * 2.5,
                                    Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              todayNotificationsList.forEach((element) {
                                element['selected'] = true;
                              });
                              yesterdayNotificationsList.forEach((element) {
                                element['selected'] = true;
                              });
                              last7DaysNotificationsList.forEach((element) {
                                element['selected'] = true;
                              });
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 5,
                                  width: screenWidth * 5,
                                  child: Image.asset('assets/select_all.png'),
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Select all', screenWidth * 2.5,
                                    Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
      ],
    );
  }

  Widget todayNotifications(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text(todayNotificationsList.isEmpty ? '' : 'Today',
              screenWidth * 4.4, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        for (int i = 0; i < todayNotificationsList.length; i++)
          GestureDetector(
            onLongPress: () {
              setState(() {
                todayNotificationsList[i]['selected'] =
                    !todayNotificationsList[i]['selected'];
                if (todayNotificationsList[i]['selected']) {
                  selectedList.add(todayNotificationsList[i]);
                } else {
                  selectedList.remove(todayNotificationsList[i]);
                }
              });
            },
            child: Container(
              height: screenWidth * 19,
              color: todayNotificationsList[i]['selected']
                  ? theme.mainColor.withOpacity(.2)
                  : theme.appBackgroundColor,
              margin: EdgeInsets.symmetric(vertical: screenWidth * 1)
                  .copyWith(bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 15,
                    height: screenWidth * 15,
                    child: Container(
                      width: screenWidth * 16,
                      height: screenWidth * 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.darkTextColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/${todayNotificationsList[i]['image']}')),
                          boxShadow: theme.boxShadow),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(screenWidth * 3)
                        .copyWith(top: screenWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text(todayNotificationsList[i]['description'],
                                screenWidth * 3.3, theme.darkTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .7,
                            ),
                            text(
                                todayNotificationsList[i]['time'],
                                screenWidth * 2.5,
                                theme.lightTextColor.withOpacity(.8),
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget yesterdayNotifications(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text(yesterdayNotificationsList.isEmpty ? '' : 'Yesterday',
              screenWidth * 4.4, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        for (int i = 0; i < yesterdayNotificationsList.length; i++)
          GestureDetector(
            onLongPress: () {
              setState(() {
                yesterdayNotificationsList[i]['selected'] =
                    !yesterdayNotificationsList[i]['selected'];
                if (yesterdayNotificationsList[i]['selected']) {
                  selectedList.add(yesterdayNotificationsList[i]);
                } else {
                  selectedList.remove(yesterdayNotificationsList[i]);
                }
              });
            },
            child: Container(
              height: screenWidth * 19,
              color: yesterdayNotificationsList[i]['selected']
                  ? theme.mainColor.withOpacity(.2)
                  : theme.appBackgroundColor,
              margin: EdgeInsets.symmetric(vertical: screenWidth * 1)
                  .copyWith(bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 15,
                    height: screenWidth * 15,
                    child: Container(
                      width: screenWidth * 16,
                      height: screenWidth * 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.darkTextColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/${yesterdayNotificationsList[i]['image']}')),
                          boxShadow: theme.boxShadow),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(screenWidth * 3)
                        .copyWith(top: screenWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text(yesterdayNotificationsList[i]['description'],
                                screenWidth * 3.3, theme.darkTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .7,
                            ),
                            text(
                                yesterdayNotificationsList[i]['time'],
                                screenWidth * 2.5,
                                theme.lightTextColor.withOpacity(.8),
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget last7DaysNotifications(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text(last7DaysNotificationsList.isEmpty ? '' : 'Last 7 Days',
              screenWidth * 4.4, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        for (int i = 0; i < last7DaysNotificationsList.length; i++)
          GestureDetector(
            onLongPress: () {
              setState(() {
                last7DaysNotificationsList[i]['selected'] =
                    !last7DaysNotificationsList[i]['selected'];
                if (last7DaysNotificationsList[i]['selected']) {
                  selectedList.add(last7DaysNotificationsList[i]);
                } else {
                  selectedList.remove(last7DaysNotificationsList[i]);
                }
              });
            },
            child: Container(
              height: screenWidth * 19,
              color: last7DaysNotificationsList[i]['selected']
                  ? theme.mainColor.withOpacity(.2)
                  : theme.appBackgroundColor,
              margin: EdgeInsets.symmetric(vertical: screenWidth * 1)
                  .copyWith(bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 15,
                    height: screenWidth * 15,
                    child: Container(
                      width: screenWidth * 16,
                      height: screenWidth * 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.darkTextColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/${last7DaysNotificationsList[i]['image']}')),
                          boxShadow: theme.boxShadow),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(screenWidth * 3)
                        .copyWith(top: screenWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text(last7DaysNotificationsList[i]['description'],
                                screenWidth * 3.3, theme.darkTextColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: screenWidth * .7,
                            ),
                            text(
                                last7DaysNotificationsList[i]['time'],
                                screenWidth * 2.5,
                                theme.lightTextColor.withOpacity(.8),
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
      ],
    );
  }

  List<dynamic> todayNotificationsList = [
    {
      'name': 'Don john',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
    {
      'name': 'Don john',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
  ];
  List<dynamic> yesterdayNotificationsList = [
    {
      'name': 'Don john',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
    {
      'name': 'Scott',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
    {
      'name': 'John Cena',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About 2 hours ago',
      'selected': false
    },
    {
      'name': 'Brock Lesnar',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About 15 minutes ago',
      'selected': false
    },
  ];
  List<dynamic> last7DaysNotificationsList = [
    {
      'name': 'Don john',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
    {
      'name': 'Don john',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
    {
      'name': 'Daneil',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
    {
      'name': 'Scott',
      'description': 'Lorem ipsum dolor sit amet, consetetur elitr,  et justo',
      'image': 'chat_pic.png',
      'time': 'About an hour ago',
      'selected': false
    },
  ];
}
