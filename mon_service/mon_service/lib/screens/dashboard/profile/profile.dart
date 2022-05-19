import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/profile/buyer/buyer.dart';
import 'package:mon_service/screens/dashboard/profile/seller/seller.dart';
import 'package:mon_service/theme/theme.dart';
import 'package:provider/provider.dart';

import '../dashboard.dart';

class Profile extends StatefulWidget {
  final int selectedIndex;
  const Profile({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<stateSettingProvider>(context);
    return Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * .30,
          width: double.infinity,
          color: theme.mainColor,
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * .70,
          width: double.infinity,
          color: theme.appBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                provData.isSellerMode ? Seller() : Buyer(),
                SizedBox(height: screenWidth * 20)
              ],
            ),
          ),
        ),
      ),
      buyerOrSellerModeBlock(screenWidth, provData),
    ]);
  }

  Widget buyerOrSellerModeBlock(screenWidth, stateSettingProvider provData) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height * .73,
        width: double.infinity,
        child: Container(
          height: screenWidth * 13,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 6),
          decoration: BoxDecoration(
              color: theme.appBackgroundColor,
              boxShadow: [
                BoxShadow(
                    color: theme.lightTextColor.withOpacity(.3),
                    offset: Offset(1, 1),
                    blurRadius: 4)
              ],
              borderRadius: BorderRadius.circular(screenWidth * 2)),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Seller Mode', screenWidth * 3.5, theme.mainColor,
                  fontWeight: FontWeight.w500),
              GestureDetector(
                onTap: () {
                  setState(() {
                    provData.isSellerMode = !provData.isSellerMode;
                    if (provData.isSellerMode) {
                      Provider.of<stateSettingProvider>(context, listen: false)
                          .sellerModeOn();
                    } else {
                      Provider.of<stateSettingProvider>(context, listen: false)
                          .buyerModeOn();
                    }
                  });
                },
                child: SizedBox(
                  height: screenWidth * 6,
                  width: screenWidth * 10,
                  child: Stack(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: screenWidth * 1.5),
                        decoration: BoxDecoration(
                            color: provData.isSellerMode
                                ? theme.mainColor.withOpacity(.7)
                                : theme.lightTextColor.withOpacity(.5),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 40)),
                      ),
                      Align(
                        alignment: provData.isSellerMode
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: screenWidth * 6,
                          decoration: BoxDecoration(
                              color: provData.isSellerMode
                                  ? theme.mainColor
                                  : theme.lightTextColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 40)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
