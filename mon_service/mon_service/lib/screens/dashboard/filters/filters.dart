import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:mon_service/theme/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  double priceRangeStart = 0;
  double priceRangeEnd = 1000;
  double distanceRange = 0;
  double sellerlevelRange = 0;
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
              title: text('Filters', screenWidth * 5, theme.mainColor,
                  fontWeight: FontWeight.w700)),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenWidth * 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('Categories', screenWidth * 4, theme.darkTextColor,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: screenWidth * 3.3,
                          width: screenWidth * 3.3,
                          child: Image.asset('assets/play.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth * 8),
                  price(screenWidth),
                  SizedBox(height: screenWidth * 8),
                  distance(screenWidth),
                  SizedBox(height: screenWidth * 8),
                  sellerLevel(screenWidth),
                  SizedBox(height: screenWidth * 8),
                  sellerlanguage(screenWidth),
                  SizedBox(
                    height: screenWidth * 40,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: screenWidth * 12.5,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.mainColor,
                        borderRadius: BorderRadius.circular(screenWidth * 100),
                      ),
                      child: Text(
                        'APPLY',
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
            ),
          )),
    );
  }

  Widget price(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text('Price', screenWidth * 3.9, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        SfSliderTheme(
          data: SfRangeSliderThemeData(
              activeTrackHeight: 1, inactiveTrackHeight: 1),
          child: SfRangeSlider(
            tooltipTextFormatterCallback: (actualValue, formattedText) {
              double d = actualValue;

              return '${d.toStringAsFixed(0)} years old';
            },
            endThumbIcon: Container(
              decoration:
                  BoxDecoration(color: theme.mainColor, shape: BoxShape.circle),
            ),
            min: 0,
            max: 1000,
            inactiveColor: theme.mainColor.withOpacity(.4),
            activeColor: theme.mainColor,
            startThumbIcon: Container(
              decoration:
                  BoxDecoration(color: theme.mainColor, shape: BoxShape.circle),
            ),
            values: SfRangeValues(priceRangeStart, priceRangeEnd),
            onChanged: (value) {
              setState(() {
                priceRangeStart = value.start;
                priceRangeEnd = value.end;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('\$${priceRangeStart.toStringAsFixed(0)}', screenWidth * 3.3,
                  theme.lightTextColor,
                  fontWeight: FontWeight.w600),
              text('\$${priceRangeEnd.toStringAsFixed(0)}', screenWidth * 3.3,
                  theme.lightTextColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        )
      ],
    );
  }

  Widget distance(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text('Distance', screenWidth * 3.9, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        SfSlider(
          tooltipTextFormatterCallback: (actualValue, formattedText) {
            double d = actualValue;

            return '${d.toStringAsFixed(0)} years old';
          },
          min: 0,
          max: 500,
          inactiveColor: theme.mainColor.withOpacity(.4),
          activeColor: theme.mainColor,
          value: distanceRange,
          onChanged: (value) {
            setState(() {
              distanceRange = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('${distanceRange.toStringAsFixed(0)}km', screenWidth * 3.3,
                  theme.lightTextColor,
                  fontWeight: FontWeight.w600),
              text('150km', screenWidth * 3.3, theme.lightTextColor,
                  fontWeight: FontWeight.w600),
              text('500km', screenWidth * 3.3, theme.lightTextColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        )
      ],
    );
  }

  Widget sellerLevel(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text('Seller Level', screenWidth * 3.9, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        SfSlider(
          tooltipTextFormatterCallback: (actualValue, formattedText) {
            double d = actualValue;

            return '${d.toStringAsFixed(0)} years old';
          },
          min: 0,
          max: 500,
          inactiveColor: theme.mainColor.withOpacity(.4),
          activeColor: theme.mainColor,
          value: sellerlevelRange,
          onChanged: (value) {
            setState(() {
              sellerlevelRange = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Beginner', screenWidth * 3.3, theme.lightTextColor,
                  fontWeight: FontWeight.w600),
              text('Rising talent', screenWidth * 3.3, theme.lightTextColor,
                  fontWeight: FontWeight.w600),
              text('Best Selling', screenWidth * 3.3, theme.lightTextColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        )
      ],
    );
  }

  Widget sellerlanguage(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text('Seller Language', screenWidth * 3.9, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: TextField(
            style: textStyle(
              fontSize: screenWidth * 3.4,
              color: theme.darkTextColor,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Type here',
              hintStyle: textStyle(
                fontSize: screenWidth * 3.4,
                color: theme.lightTextColor,
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 3),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
            child: Row(
              children: [
                text('English', screenWidth * 3.5, theme.mainColor,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: screenWidth * 2,
                ),
                SizedBox(
                  height: screenWidth * 2.8,
                  width: screenWidth * 2.8,
                  child: Image.asset('assets/close.png'),
                )
              ],
            )),
      ],
    );
  }
}
