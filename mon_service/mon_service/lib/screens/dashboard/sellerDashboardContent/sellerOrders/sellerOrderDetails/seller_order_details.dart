import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';

import 'package:mon_service/theme/theme.dart';

import '../../../dashboard.dart';

class SellerOrderDetails extends StatefulWidget {
  final int selectedIndex;
  final String status;
  final Color color;
  final String review;

  SellerOrderDetails(
      {Key? key,
      required this.selectedIndex,
      required this.status,
      required this.color,
      required this.review})
      : super(key: key);

  @override
  _SellerOrderDetailsState createState() => _SellerOrderDetailsState();
}

class _SellerOrderDetailsState extends State<SellerOrderDetails> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  bool isUnavailable = false;
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
                      height: screenWidth * 4,
                    ),
                    Row(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          'assets/arrow_back.png',
                          height: screenWidth * 4,
                          width: screenWidth * 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 3,
                      ),
                      text('Fix the plumbing Leakage', screenWidth * 4.8,
                          theme.darkTextColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(height: screenWidth),
                    ]),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    topBlock(screenWidth),
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    chatOrMarkComplete(screenWidth),
                    detailsBlock(screenWidth)
                  ],
                ),
              ),
            )));
  }

  AppBar appBar(screenWidth) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: text('Orders', screenWidth * 5, theme.mainColor,
            fontWeight: FontWeight.w700));
  }

  Widget topBlock(screenWidth) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 3),
      ),
      child: Row(
        children: [
          SizedBox(
              width: screenWidth * 33,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 3),
                child: Image.asset(
                  'assets/person_image2.png',
                  height: screenWidth * 30,
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
              child: Padding(
            padding:
                EdgeInsets.all(screenWidth * 2).copyWith(left: screenWidth * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: text('\$200', screenWidth * 5.5, theme.mainColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: screenWidth * 11,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    text('Order Start : Aug, 10,2021', screenWidth * 2.8,
                        theme.lightTextColor,
                        fontWeight: FontWeight.w500),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          text(widget.status, screenWidth * 3.2, widget.color,
                              fontWeight: FontWeight.w600),
                          widget.status == 'Completed' ||
                                  widget.status == 'Cancelled'
                              ? Padding(
                                  padding: EdgeInsets.only(left: screenWidth),
                                  child: Image.asset(
                                      widget.status == 'Completed'
                                          ? 'assets/done_circle.png'
                                          : 'assets/close_circle.png',
                                      color: widget.status == 'Completed'
                                          ? Colors.green.shade300
                                          : Colors.red.shade300,
                                      height: screenWidth * 4,
                                      width: screenWidth * 4),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                    text('Delivery Date : Aug 20,2021', screenWidth * 3.3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget chatOrMarkComplete(screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenWidth * 8,
              width: screenWidth * 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/person_image2.png'))),
            ),
            SizedBox(
              height: screenWidth,
            ),
            text('Test user', screenWidth * 2.8, theme.darkTextColor,
                fontWeight: FontWeight.w500),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: screenWidth * 4),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 5, vertical: screenWidth * 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 40),
                  color: theme.mainColor),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text('Chat with Buyer', screenWidth * 3, Colors.white,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            widget.status != 'In Progress'
                ? SizedBox()
                : GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => CancelOrderReason()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 4),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 5,
                          vertical: screenWidth * 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenWidth * 40),
                          color: theme.mainColor),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          text(
                              'Mark as Complete', screenWidth * 3, Colors.white,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Widget detailsBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenWidth * 7),
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Buyer\'s Phone Number', screenWidth * 2.8,
                  theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(height: screenWidth),
              text('0123 456789', screenWidth * 3.7, theme.darkTextColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Buyer\'s Address', screenWidth * 2.8, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(height: screenWidth),
              text('RM8 NL, PO3457, New York', screenWidth * 3.7,
                  theme.darkTextColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Order Details', screenWidth * 2.8, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(height: screenWidth),
              text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                  screenWidth * 3.2,
                  theme.darkTextColor,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(widget.status == 'Cancelled' ? 'Buyers Note' : 'Reviews',
                  screenWidth * 2.8, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(height: screenWidth),
              widget.status == 'Completed'
                  ? Padding(
                      padding: EdgeInsets.only(bottom: screenWidth * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: screenWidth * 6,
                            )
                        ],
                      ),
                    )
                  : SizedBox(),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: widget.status == 'In Progress'
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    widget.status == 'Completed'
                        ? Container(
                            margin: EdgeInsets.only(right: screenWidth * 2),
                            height: screenWidth * 8,
                            width: screenWidth * 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/person_image2.png'))),
                          )
                        : SizedBox(),
                    text(
                        widget.review,
                        widget.status == 'Cancelled'
                            ? screenWidth * 3.2
                            : screenWidth * 3,
                        widget.status == 'Cancelled'
                            ? theme.darkTextColor
                            : theme.lightTextColor,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                    'assets/policy.png',
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
