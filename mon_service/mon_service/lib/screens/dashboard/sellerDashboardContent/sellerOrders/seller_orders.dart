import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/sellerDashboardContent/sellerOrders/sellerOrderDetails/seller_order_details.dart';
import 'package:mon_service/theme/theme.dart';

class SellerOrders extends StatelessWidget {
  final int selectedIndex;
  const SellerOrders({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenWidth * 5,
          ),
          for (int i = 0; i < 5; i++)
            GestureDetector(
              onTap: () {
                if (i != 1 && i != 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellerOrderDetails(
                            selectedIndex: selectedIndex,
                            status: 'In Progress',
                            color: theme.darkTextColor,
                            review: 'Order needs to be completed for reviews',
                          )));
                }
                if (i == 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellerOrderDetails(
                            selectedIndex: selectedIndex,
                            status: 'Completed',
                            color: Colors.green.shade300,
                            review:
                                'A great experience overall with this seller',
                          )));
                }
                if (i == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellerOrderDetails(
                            selectedIndex: selectedIndex,
                            status: 'Cancelled',
                            color: Colors.red.shade300,
                            review: 'Seller was not responsive',
                          )));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 4, vertical: screenWidth * 1.5),
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: theme.boxShadow,
                    borderRadius: BorderRadius.circular(screenWidth * 3),
                    color: theme.mainColor),
                child: Row(
                  children: [
                    SizedBox(
                        width: screenWidth * 33,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(screenWidth * 3),
                          child: Image.asset(
                            'assets/person_image2.png',
                            height: screenWidth * 33,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(screenWidth * 2)
                          .copyWith(left: screenWidth * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: text('Aug 10,2021', screenWidth * 2.6,
                                    Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              text('\$200', screenWidth * 5.5, Colors.white,
                                  fontWeight: FontWeight.w600),
                              text('Fix the plumbing Leakage',
                                  screenWidth * 2.8, Colors.white,
                                  fontWeight: FontWeight.w500),
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
                                      Colors.white,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    text(
                                        i == 1
                                            ? 'Completed'
                                            : i == 2
                                                ? 'Cancelled'
                                                : 'In Progress',
                                        screenWidth * 2.9,
                                        i == 1
                                            ? Colors.green.shade300
                                            : i == 2
                                                ? Colors.red.shade300
                                                : Colors.black.withOpacity(.5),
                                        fontWeight: FontWeight.w700),
                                    i != 1 && i != 2
                                        ? SizedBox()
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                left: screenWidth),
                                            child: Image.asset(
                                                i == 1
                                                    ? 'assets/done_circle.png'
                                                    : 'assets/close_circle.png',
                                                color: i == 1
                                                    ? Colors.green.shade300
                                                    : Colors.red.shade300,
                                                height: screenWidth * 4,
                                                width: screenWidth * 4),
                                          )
                                  ],
                                ),
                              )
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
    );
  }
}
