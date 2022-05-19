import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/profile/profile.dart';
import 'package:mon_service/theme/theme.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  bool showAllReviews = false;
  bool showAllWork = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: appBar(screenWidth),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .33,
                width: double.infinity,
                color: theme.mainColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .67,
                width: double.infinity,
                color: theme.appBackgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showAllReviews
                          ? allReviews(screenWidth)
                          : showAllWork
                              ? allWork(screenWidth)
                              : profileDetailsBlock(screenWidth)
                    ],
                  ),
                ),
              ),
            ),
            topProfilePicDetailsBlock(screenWidth),
          ],
        ),
      ),
    );
  }

  AppBar appBar(screenWidth) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: screenWidth * 5,
        ),
      ),
      title: text('Seller Profile', screenWidth * 5, Colors.white,
          fontWeight: FontWeight.w700),
      actions: [
        SizedBox(
          height: screenWidth * 4.5,
          width: screenWidth * 4.5,
          child: Image.asset(
            'assets/chat_icon.png',
            color: Colors.white,
          ),
        ),
        SizedBox(width: screenWidth * 4)
      ],
    );
  }

  Widget profileDetailsBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personalInfo(screenWidth),
        reviews(screenWidth),
        SizedBox(
          height: screenWidth,
        ),
        sellersWork(screenWidth),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget allReviews(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 28,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 4),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      showAllReviews = false;
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: screenWidth * 4,
                    color: theme.darkTextColor,
                  )),
              SizedBox(
                width: screenWidth * 4,
              ),
              text('Reviews', screenWidth * 5.5, theme.darkTextColor,
                  fontWeight: FontWeight.w700),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 2,
        ),
        allReviewsBlock(screenWidth)
      ],
    );
  }

  Widget allWork(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 28,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 4),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      showAllWork = false;
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: screenWidth * 4,
                    color: theme.darkTextColor,
                  )),
              SizedBox(
                width: screenWidth * 4,
              ),
              text('Work', screenWidth * 5.5, theme.darkTextColor,
                  fontWeight: FontWeight.w700),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 2,
        ),
        allWorkBlock(screenWidth)
      ],
    );
  }

  Widget topProfilePicDetailsBlock(screenWidth) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .83,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: screenWidth * 60,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
              //  color: Colors.red,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: screenWidth * 50,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 9),
                    decoration: BoxDecoration(
                        color: theme.appBackgroundColor.withOpacity(.4),
                        borderRadius: BorderRadius.circular(screenWidth * 2)),
                  ),
                  Container(
                    height: screenWidth * 47,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 6),
                    decoration: BoxDecoration(
                        color: theme.appBackgroundColor.withOpacity(.4),
                        borderRadius: BorderRadius.circular(screenWidth * 2)),
                  ),
                  Container(
                    height: screenWidth * 44,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 3),
                    decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: theme.lightTextColor.withOpacity(.3),
                              offset: Offset(1, 1),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(screenWidth * 2)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenWidth * 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: screenWidth * 4.2,
                            ),
                            text('4.2', screenWidth * 3.7,
                                theme.lightTextColor.withOpacity(.8),
                                fontWeight: FontWeight.w500)
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 1.5,
                        ),
                        text('Scott Adkins', screenWidth * 4.6,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w500),
                        text('Replies within a few minutes', screenWidth * 2.6,
                            theme.mainColor,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: screenWidth * 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text('3250', screenWidth * 4.3,
                                    theme.darkTextColor,
                                    fontWeight: FontWeight.w700),
                                text('Total Jobs', screenWidth * 3,
                                    theme.lightTextColor,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text('2.5', screenWidth * 4.3,
                                    theme.darkTextColor,
                                    fontWeight: FontWeight.w700),
                                text('Years', screenWidth * 3,
                                    theme.lightTextColor,
                                    fontWeight: FontWeight.w500),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Profil));
                      },
                      child: SizedBox(
                        width: screenWidth * 25,
                        height: screenWidth * 25,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.appBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          theme.lightTextColor.withOpacity(.3),
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ],
                              ),
                              child: Container(
                                margin: EdgeInsets.all(screenWidth * .8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.darkTextColor,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/person_image.png')),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: screenWidth * 1.5,
                                right: screenWidth * 1.5,
                                child: Container(
                                  height: screenWidth * 4.5,
                                  width: screenWidth * 4.5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green.shade400),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget personalInfo(screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 32),
          text('PERSONAL INFO', screenWidth * 4.6, theme.darkTextColor,
              fontWeight: FontWeight.w600),
          SizedBox(
            height: screenWidth * 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text('Contact', screenWidth * 3.4, theme.lightTextColor,
                      fontWeight: FontWeight.w600),
                  text('+91 931 488 2375', screenWidth * 3.2,
                      theme.lightTextColor,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text('Email', screenWidth * 3.4, theme.lightTextColor,
                      fontWeight: FontWeight.w600),
                  text('Alex@getfix.com', screenWidth * 3.2,
                      theme.lightTextColor,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text('Languages', screenWidth * 3.4, theme.lightTextColor,
                      fontWeight: FontWeight.w600),
                  text('English and Spanish', screenWidth * 3.2,
                      theme.lightTextColor,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text('Address', screenWidth * 3.4, theme.lightTextColor,
                      fontWeight: FontWeight.w600),
                  text('RM8 NL, PO3457, New York', screenWidth * 3.2,
                      theme.lightTextColor,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget reviews(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Reviews', screenWidth * 4.6, theme.darkTextColor,
                  fontWeight: FontWeight.w600),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAllReviews = true;
                  });
                },
                child: text('See all reviews', screenWidth * 3, theme.mainColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 2,
        ),
        SizedBox(
          height: screenWidth * 26,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: screenWidth * 4),
              itemBuilder: (context, index) {
                return Container(
                    alignment: Alignment.center,
                    width: screenWidth * 70,
                    padding: EdgeInsets.all(screenWidth * 3),
                    margin: EdgeInsets.only(right: screenWidth * 4),
                    decoration: BoxDecoration(
                        color: theme.mainColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(screenWidth * 3)),
                    child: Row(
                      children: [
                        Container(
                          height: screenWidth * 22,
                          width: screenWidth * 22,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/person_image.png'))),
                        ),
                        SizedBox(
                          width: screenWidth * 3,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  text('Scott adkins', screenWidth * 3.2,
                                      theme.darkTextColor,
                                      fontWeight: FontWeight.w600),
                                  for (int i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                      size: screenWidth * 3.1,
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth,
                              ),
                              text('"Cool"', screenWidth * 3,
                                  theme.darkTextColor,
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                height: screenWidth,
                              ),
                              text('Lorem ipsum dolor sit amet, consetetur ',
                                  screenWidth * 2.4, theme.darkTextColor,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }

  Widget sellersWork(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Sellers work', screenWidth * 4.6, theme.darkTextColor,
                  fontWeight: FontWeight.w600),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAllWork = true;
                  });
                },
                child: text('See all orders', screenWidth * 3, theme.mainColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 2,
        ),
        SizedBox(
          height: screenWidth * 20,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: screenWidth * 4),
              itemBuilder: (context, index) {
                return Container(
                  height: screenWidth * 20,
                  width: screenWidth * 20,
                  margin: EdgeInsets.only(right: screenWidth * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 3),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(index % 3 == 0
                              ? 'assets/person_image2.png'
                              : 'assets/person_image.png'))),
                );
              }),
        )
      ],
    );
  }

  Widget allReviewsBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 5; i++)
          Container(
              alignment: Alignment.center,
              height: screenWidth * 23,
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 3),
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                  .copyWith(bottom: screenWidth * 3),
              decoration: BoxDecoration(
                  color: theme.mainColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(screenWidth * 3)),
              child: Row(
                children: [
                  Container(
                    height: screenWidth * 22,
                    width: screenWidth * 22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/person_image.png'))),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            text('Scott adkins', screenWidth * 3.2,
                                theme.darkTextColor,
                                fontWeight: FontWeight.w600),
                            for (int i = 0; i < 5; i++)
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                                size: screenWidth * 3.1,
                              ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth,
                        ),
                        text('"Cool"', screenWidth * 3, theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: screenWidth,
                        ),
                        text(
                            'Lorem ipsum dolor sit amet, consetetur Lorem ipsum dolor sit amet, consetetur ',
                            screenWidth * 2.4,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  )
                ],
              ))
      ],
    );
  }

  Widget allWorkBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 5; i++)
          Container(
              alignment: Alignment.center,
              height: screenWidth * 23,
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 3),
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                  .copyWith(bottom: screenWidth * 3),
              decoration: BoxDecoration(
                  color: theme.mainColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(screenWidth * 3)),
              child: Row(
                children: [
                  Container(
                    height: screenWidth * 22,
                    width: screenWidth * 22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/person_image.png'))),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            text('Project name', screenWidth * 3.2,
                                theme.darkTextColor,
                                fontWeight: FontWeight.w600),
                            for (int i = 0; i < 5; i++)
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                                size: screenWidth * 3.1,
                              ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth,
                        ),
                        text('Duration', screenWidth * 3, theme.darkTextColor,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: screenWidth,
                        ),
                        text(
                            'Lorem ipsum dolor sit amet, consetetur Lorem ipsum dolor sit amet, consetetur ',
                            screenWidth * 2.4,
                            theme.darkTextColor,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  )
                ],
              ))
      ],
    );
  }
}
