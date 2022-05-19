import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/checkoutDetails/manageOrders/orderDetails/cancelOrderReason/cancel_order_reason.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/sellerProfile/seller_profile.dart';
import 'package:mon_service/theme/theme.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          appBar: AppBar(
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
              title: text('Order Details', screenWidth * 5, theme.mainColor,
                  fontWeight: FontWeight.w700)),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenWidth * 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 4,
                          vertical: screenWidth * 1.5),
                      height: screenWidth * 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: theme.boxShadow,
                          borderRadius: BorderRadius.circular(screenWidth * 3),
                          color: theme.appBackgroundColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 3),
                            child: SizedBox(
                                width: screenWidth * 33,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 3),
                                  child: Image.asset(
                                    'assets/person_image2.png',
                                    height: screenWidth * 35,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(screenWidth * 3)
                                .copyWith(left: screenWidth),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenWidth,
                                    ),
                                    text('Do professional ui ux for websites',
                                        screenWidth * 3.5, theme.darkTextColor,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: screenWidth,
                                    ),
                                    text('Oct 6 2020', screenWidth * 2.6,
                                        theme.lightTextColor,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      height: screenWidth * 2,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: screenWidth * 7,
                                          width: screenWidth * 7,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/person_image2.png'))),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 1.5,
                                        ),
                                        text('Test user', screenWidth * 2.9,
                                            theme.darkTextColor,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: text(
                                          'In Progress',
                                          screenWidth * 2.9,
                                          Colors.red.shade700,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 5),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 4),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 3,
                              vertical: screenWidth * 2),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 40),
                              color: theme.mainColor),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              text('Chat with seller', screenWidth * 2.7,
                                  Colors.white,
                                  fontWeight: FontWeight.w500),
                              SizedBox(width: screenWidth),
                              SizedBox(
                                height: screenWidth * 3.5,
                                width: screenWidth * 3.5,
                                child: Image.asset('assets/chat_icon.png'),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CancelOrderReason()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: screenWidth * 4),
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 6,
                                vertical: screenWidth * 2),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 40),
                                color: Colors.red.shade700),
                            child: text(
                                'Cancel order', screenWidth * 2.7, Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                          .copyWith(bottom: screenWidth * 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('Job Detail', screenWidth * 4.2,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w600),
                          SizedBox(height: screenWidth),
                          text(
                              'New shower installed with wall sockets and  general  service and cleaning  pipe...',
                              screenWidth * 3.2,
                              theme.lightTextColor.withOpacity(.8),
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                          .copyWith(bottom: screenWidth * 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('Delivery date', screenWidth * 4.2,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w600),
                          SizedBox(height: screenWidth),
                          text('2020 05 30', screenWidth * 3.2,
                              theme.lightTextColor.withOpacity(.8),
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                          .copyWith(bottom: screenWidth * 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('Sellers Note', screenWidth * 4.2,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w600),
                          SizedBox(height: screenWidth),
                          text('Done', screenWidth * 3.2,
                              theme.lightTextColor.withOpacity(.8),
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SellerProfile()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(bottom: screenWidth * 3),
                    height: screenWidth * 12.5,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.mainColor,
                      borderRadius: BorderRadius.circular(screenWidth * 100),
                    ),
                    child: Text(
                      'COMPLETE AND REVIEW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: theme.whiteColor,
                          fontSize: screenWidth * 4,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
