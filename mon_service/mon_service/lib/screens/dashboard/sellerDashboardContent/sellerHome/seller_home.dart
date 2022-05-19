import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

class SellerHome extends StatelessWidget {
  final int selectedIndex;
  const SellerHome({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * 4,
            ),
            topBlock(screenWidth),
            SizedBox(
              height: screenWidth * 4,
            ),
            myEarnings(screenWidth),
            SizedBox(
              height: screenWidth * 4,
            ),
            impressions(screenWidth)
          ],
        ),
      ),
    );
  }

  Widget topBlock(screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 4),
      width: double.infinity,
      color: theme.mainColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text('Your Current Stats', screenWidth * 4.5, Colors.white,
              fontWeight: FontWeight.w700),
          SizedBox(
            height: screenWidth * 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Seller Level', screenWidth * 3.5, Colors.white,
                        fontWeight: FontWeight.w600),
                    text('Level 1', screenWidth * 3.5, Colors.white,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                SizedBox(
                  height: screenWidth * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Response Time', screenWidth * 3.5, Colors.white,
                        fontWeight: FontWeight.w600),
                    text('1 hour', screenWidth * 3.5, Colors.white,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                SizedBox(
                  height: screenWidth * 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: screenWidth * 2),
                          alignment: Alignment.center,
                          height: screenWidth * 15,
                          width: screenWidth * 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2.5)),
                          child: text('100%', screenWidth * 4, Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        text('Response\nRate', screenWidth * 3, Colors.white,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: screenWidth * 2),
                          alignment: Alignment.center,
                          height: screenWidth * 15,
                          width: screenWidth * 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2.5)),
                          child: text('100%', screenWidth * 4, Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        text('Order\nCompletion', screenWidth * 3, Colors.white,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: screenWidth * 2),
                          alignment: Alignment.center,
                          height: screenWidth * 15,
                          width: screenWidth * 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2.5)),
                          child: text('100%', screenWidth * 4, Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        text('On-time\nDelivery', screenWidth * 3, Colors.white,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: screenWidth * 2),
                          alignment: Alignment.center,
                          height: screenWidth * 15,
                          width: screenWidth * 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: theme.darkTextColor.withOpacity(.8),
                                  width: 2.5)),
                          child: text('N/A', screenWidth * 4, Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        text('Positive\nRating', screenWidth * 3, Colors.white,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 2,
          )
        ],
      ),
    );
  }

  Widget myEarnings(screenWidth) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        text('My Earnings', screenWidth * 4.5, theme.darkTextColor,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: screenWidth * 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('Personal balance', screenWidth * 3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('\$100.00', screenWidth * 4.3, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('Earnings this month', screenWidth * 3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('\$8.00', screenWidth * 4.3, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('Avg. selling price', screenWidth * 3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('\$40.00', screenWidth * 4.3, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('        Active orders        ', screenWidth * 3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('3', screenWidth * 4.3, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('Pending clearance', screenWidth * 3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('\$20.00', screenWidth * 4.3, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('    Cancelled orders    ', screenWidth * 3,
                        theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth,
                    ),
                    text('0', screenWidth * 4.3, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }

  Widget impressions(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text('My Gigs', screenWidth * 4.5, theme.darkTextColor,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: screenWidth * 3,
        ),
        Container(
          width: double.infinity,
          color: theme.mainColor,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 4, vertical: screenWidth * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Impressions', screenWidth * 3.8, Colors.white,
                  fontWeight: FontWeight.w600),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text('Last 3 days', screenWidth * 2.8, Colors.white,
                      fontWeight: FontWeight.w500),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text('200', screenWidth * 3.8, Colors.white,
                          fontWeight: FontWeight.w600),
                      Icon(
                        Icons.expand_more,
                        color: Colors.white,
                        size: screenWidth * 4,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
