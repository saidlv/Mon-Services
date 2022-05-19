import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            popularServices(screenWidth),
            recentAndMore(screenWidth),
            recommended(screenWidth)
          ],
        ),
      ),
    );
  }

  Widget popularServices(screenWidth) {
    return Column(
      children: [
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Popular services', screenWidth * 4, theme.darkTextColor,
                  fontWeight: FontWeight.bold),
              text('See all', screenWidth * 3, theme.mainColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 45,
          width: double.infinity,
          child: ListView.builder(
              padding: EdgeInsets.only(left: screenWidth),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(screenWidth * 3),
                  height: screenWidth * 35,
                  width: screenWidth * 40,
                  decoration: BoxDecoration(
                      boxShadow: theme.boxShadow,
                      color: theme.appBackgroundColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(screenWidth * 3),
                          bottomRight: Radius.circular(screenWidth * 3))),
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset(
                        'assets/grocery.png',
                        width: screenWidth * 40,
                        fit: BoxFit.cover,
                      )),
                      SizedBox(
                        height: screenWidth * 9,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 2),
                            child: text(
                                'Grocery', screenWidth * 3, theme.darkTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget recentAndMore(screenWidth) {
    return Column(
      children: [
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Recent & More', screenWidth * 4, theme.darkTextColor,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: screenWidth * 4.5,
                width: screenWidth * 4.5,
                child: Image.asset(
                  'assets/filter2.png',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 65,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: screenWidth),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(screenWidth * 3),
                  height: screenWidth * 55,
                  width: screenWidth * 50,
                  decoration: BoxDecoration(
                      boxShadow: theme.boxShadow,
                      color: theme.appBackgroundColor,
                      borderRadius: BorderRadius.circular(screenWidth * 3)),
                  child: Column(
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 3),
                            topRight: Radius.circular(screenWidth * 3)),
                        child: Image.asset(
                          'assets/person_image.png',
                          width: screenWidth * 50,
                          fit: BoxFit.cover,
                        ),
                      )),
                      Expanded(
                        child: SizedBox(
                            height: screenWidth * 8,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: screenWidth * 7,
                                        width: screenWidth * 7,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 50),
                                          child: Image.asset(
                                            'assets/person_image.png',
                                            width: screenWidth * 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 3,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text('Lorem Ipsium', screenWidth * 3,
                                              theme.darkTextColor,
                                              fontWeight: FontWeight.w500),
                                          text(
                                              'Level 1 seller',
                                              screenWidth * 2.2,
                                              theme.lightTextColor,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenWidth * 2,
                                  ),
                                  text(
                                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                                      screenWidth * 2.3,
                                      theme.darkTextColor,
                                      fontWeight: FontWeight.w500),
                                  SizedBox(
                                    height: screenWidth * 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            child: text(
                                                ' (380)',
                                                screenWidth * 2.5,
                                                theme.lightTextColor
                                                    .withOpacity(.8),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      text('\$34', screenWidth * 4,
                                          theme.lightTextColor,
                                          fontWeight: FontWeight.w500)
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget recommended(screenWidth) {
    return Column(
      children: [
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: text('Recommended', screenWidth * 4, theme.darkTextColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: screenWidth * 65,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: screenWidth),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(screenWidth * 3),
                  height: screenWidth * 55,
                  width: screenWidth * 50,
                  decoration: BoxDecoration(
                      boxShadow: theme.boxShadow,
                      color: theme.appBackgroundColor,
                      borderRadius: BorderRadius.circular(screenWidth * 3)),
                  child: Column(
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 3),
                            topRight: Radius.circular(screenWidth * 3)),
                        child: Image.asset(
                          'assets/person_image2.png',
                          width: screenWidth * 50,
                          fit: BoxFit.cover,
                        ),
                      )),
                      Expanded(
                        child: SizedBox(
                            height: screenWidth * 8,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: screenWidth * 7,
                                        width: screenWidth * 7,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 50),
                                          child: Image.asset(
                                            'assets/person_image2.png',
                                            width: screenWidth * 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 3,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text('Lorem Ipsium', screenWidth * 3,
                                              theme.darkTextColor,
                                              fontWeight: FontWeight.w500),
                                          text(
                                              'Level 1 seller',
                                              screenWidth * 2.2,
                                              theme.lightTextColor,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenWidth * 2,
                                  ),
                                  text(
                                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                                      screenWidth * 2.3,
                                      theme.darkTextColor,
                                      fontWeight: FontWeight.w500),
                                  SizedBox(
                                    height: screenWidth * 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            child: text(
                                                ' (380)',
                                                screenWidth * 2.5,
                                                theme.lightTextColor
                                                    .withOpacity(.8),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      text('\$34', screenWidth * 4,
                                          theme.lightTextColor,
                                          fontWeight: FontWeight.w500)
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
