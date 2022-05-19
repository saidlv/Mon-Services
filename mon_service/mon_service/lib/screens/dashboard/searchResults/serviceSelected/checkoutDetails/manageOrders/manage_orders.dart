import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/checkoutDetails/manageOrders/orderDetails/order_details.dart';
import 'package:mon_service/theme/theme.dart';

class ManageOrders extends StatefulWidget {
  @override
  _ManageOrdersState createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  String selectedcategory = 'All';
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
              title: text('Manage Orders', screenWidth * 5, theme.mainColor,
                  fontWeight: FontWeight.w700)),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenWidth * 18,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < categories.length; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                categories[i]['selected'] = true;
                                selectedcategory = categories[i]['name'];
                                categories.forEach((element) {
                                  if (element['name'] ==
                                      categories[i]['name']) {
                                  } else {
                                    element['selected'] = false;
                                  }
                                });
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 4,
                                  vertical: screenWidth * 2.5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: categories[i]['selected']
                                        ? theme.mainColor
                                        : theme.lightTextColor.withOpacity(.5),
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 100)),
                              child: text(
                                  categories[i]['name'],
                                  screenWidth * 3,
                                  categories[i]['selected']
                                      ? theme.mainColor
                                      : theme.lightTextColor.withOpacity(.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                selectedcategory == 'All' ? all(screenWidth) : SizedBox()
              ],
            ),
          )),
    );
  }

  List<dynamic> categories = [
    {
      'name': 'All',
      'selected': true,
    },
    {
      'name': 'New',
      'selected': false,
    },
    {
      'name': 'In-Progress',
      'selected': false,
    },
    {
      'name': 'Closed',
      'selected': false,
    }
  ];

  Widget all(screenWidth) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: screenWidth * 10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrderDetails()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 4, vertical: screenWidth * 2),
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
                                    index % 3 == 0 ? 'New' : 'In Progress',
                                    screenWidth * 2.9,
                                    index % 3 == 0
                                        ? Colors.green.shade600
                                        : Colors.red.shade700,
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
            );
          }),
    );
  }
}
