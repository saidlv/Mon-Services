import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/profile/seller/manageGigs/manage_gigs.dart';
import 'package:mon_service/screens/dashboard/profile/seller/sellerEarnings/seller_earnings.dart';
import 'package:mon_service/screens/dashboard/profile/seller/shareGigs/share_gigs.dart';
import 'package:mon_service/theme/theme.dart';

class Seller extends StatefulWidget {
  const Seller({Key? key}) : super(key: key);

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  bool showOnlineStatus = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return sellerProfileDetailsBlock(screenWidth);
  }

  Widget sellerProfileDetailsBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mySettings(screenWidth),
        gigs(screenWidth),
        general(screenWidth),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget mySettings(screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 16),
          text('My Settings', screenWidth * 4.4, theme.darkTextColor,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: screenWidth * 4,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SellerEarnings(selectedIndex: 4)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/earning.png',
                            height: screenWidth * 4.5,
                            width: screenWidth * 4.5,
                          ),
                          SizedBox(
                            width: screenWidth * 3,
                          ),
                          text('Earnings', screenWidth * 3.4,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: screenWidth * 3.6, color: theme.darkTextColor)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth * 4.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/order.png',
                          height: screenWidth * 4.5,
                          width: screenWidth * 4.5,
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        text('Orders', screenWidth * 3.4, theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: screenWidth * 3.6, color: theme.darkTextColor)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gigs(screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 10),
          text('Gigs', screenWidth * 4.4, theme.darkTextColor,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: screenWidth * 4,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ManageGigs(selectedIndex: 4)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/manage.png',
                            height: screenWidth * 4.5,
                            width: screenWidth * 4.5,
                          ),
                          SizedBox(
                            width: screenWidth * 3,
                          ),
                          text('Manage Gigs', screenWidth * 3.4,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: screenWidth * 3.6, color: theme.darkTextColor)
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth * 4.5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShareGigs(selectedIndex: 4)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/share.png',
                            height: screenWidth * 4.5,
                            width: screenWidth * 4.5,
                          ),
                          SizedBox(
                            width: screenWidth * 3,
                          ),
                          text('Share Gigs', screenWidth * 3.4,
                              theme.darkTextColor,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: screenWidth * 3.6, color: theme.darkTextColor)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget general(screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 10),
          text('General', screenWidth * 4.4, theme.darkTextColor,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: screenWidth * 4,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/status.png',
                          height: screenWidth * 4.5,
                          width: screenWidth * 4.5,
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        text('Show online status', screenWidth * 3.4,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showOnlineStatus = !showOnlineStatus;
                        });
                      },
                      child: SizedBox(
                        height: screenWidth * 5,
                        width: screenWidth * 8,
                        child: Stack(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: screenWidth),
                              decoration: BoxDecoration(
                                  color: showOnlineStatus
                                      ? theme.mainColor.withOpacity(.7)
                                      : theme.lightTextColor.withOpacity(.5),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 40)),
                            ),
                            Align(
                              alignment: showOnlineStatus
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                width: screenWidth * 5,
                                decoration: BoxDecoration(
                                    color: showOnlineStatus
                                        ? theme.mainColor
                                        : theme.lightTextColor,
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 40)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenWidth * 4.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/invite.png',
                          height: screenWidth * 4.5,
                          width: screenWidth * 4.5,
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        text('Invite friends', screenWidth * 3.4,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    SizedBox()
                  ],
                ),
                SizedBox(
                  height: screenWidth * 4.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/support.png',
                          height: screenWidth * 4.5,
                          width: screenWidth * 4.5,
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        text('Support', screenWidth * 3.4, theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
