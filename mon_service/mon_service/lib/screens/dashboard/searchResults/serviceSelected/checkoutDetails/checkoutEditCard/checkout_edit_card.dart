import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/checkoutDetails/manageOrders/manage_orders.dart';
import 'package:mon_service/theme/theme.dart';

class CheckoutEditCard extends StatefulWidget {
  const CheckoutEditCard({Key? key}) : super(key: key);

  @override
  _CheckoutEditCardState createState() => _CheckoutEditCardState();
}

class _CheckoutEditCardState extends State<CheckoutEditCard> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        drawer: Drawer(),
        appBar: appBar(screenWidth),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 6,
              ),
              Align(
                alignment: Alignment.center,
                child: text('\$283.65', screenWidth * 6, theme.mainColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Align(
                alignment: Alignment.center,
                child: text('Payment made successfully by Card',
                    screenWidth * 3.8, theme.darkTextColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Divider(),
              SizedBox(
                height: screenWidth * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Job Details', screenWidth * 3.6,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('2Hrs.30min', screenWidth * 3, theme.mainColor,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    text(
                        'new shower installed with wall sockets and  general  service and cleaning  pipe.new shower installed with wall sockets and  general  service and cleaning  pipe.new shower installed with wall sockets and  general  service and cleaning  pipe',
                        screenWidth * 3.3,
                        theme.lightTextColor.withOpacity(.8),
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Divider(),
              SizedBox(
                height: screenWidth * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Date & Time', screenWidth * 3.4,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('22 Dec\'20 at 9 :42 am', screenWidth * 3.2,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Service Type', screenWidth * 3.4,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('Architect', screenWidth * 3.2,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                            'Job Type', screenWidth * 3.4, theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('Installation', screenWidth * 3.2,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text('Your rated ', screenWidth * 2.8,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500),
                        text('"Scott Adkins"', screenWidth * 2.8,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w500),
                        SizedBox(width: screenWidth * 2),
                        SizedBox(
                          height: screenWidth * 6,
                          width: screenWidth * 6,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 100),
                            child: Image.asset(
                              'assets/person_image2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 2),
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: i == 4
                                ? theme.lightTextColor.withOpacity(.5)
                                : Colors.yellow.shade700,
                            size: screenWidth * 3.6,
                          )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 6,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                height: screenWidth * 13,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                color: theme.lightTextColor.withOpacity(.2),
                child: text('RECEIPT', screenWidth * 4.6, theme.darkTextColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenWidth * 6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Job Fee', screenWidth * 3.4, theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$100.00', screenWidth * 3.4,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Tax', screenWidth * 3.4, theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$0.00', screenWidth * 3.4,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('+ Parts Amt.', screenWidth * 3.4,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$80.00', screenWidth * 3.4,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                            'Discount', screenWidth * 3.4, theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$10.00', screenWidth * 3.4,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Topup Added', screenWidth * 3.4,
                            theme.lightTextColor,
                            fontWeight: FontWeight.w600),
                        text('\$89.00', screenWidth * 3.4,
                            theme.lightTextColor.withOpacity(.6),
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 6,
                    ),
                  ],
                ),
              ),
              DottedLine(
                dashColor: theme.lightTextColor.withOpacity(.7),
              ),
              SizedBox(
                height: screenWidth * 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text('Your Payment', screenWidth * 3.8,
                        theme.mainColor.withOpacity(.6),
                        fontWeight: FontWeight.w700),
                    text('\$189.00', screenWidth * 3.8,
                        theme.mainColor.withOpacity(.6),
                        fontWeight: FontWeight.w700)
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 8),
                child: text(
                    'This job was towards you expectation you received Guaranteed Good Service',
                    screenWidth * 2.8,
                    theme.darkTextColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(screenWidth) {
    return AppBar(
      backgroundColor: theme.mainColor,
      title: text('Jobs Details & Receipt', screenWidth * 5, Colors.white,
          fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 4),
              bottomRight: Radius.circular(screenWidth * 4))),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ManageOrders()));
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: screenWidth * 5,
            ))
      ],
    );
  }
}
