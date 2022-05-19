import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/dashboard.dart';
import 'package:mon_service/screens/dashboard/searchResults/serviceSelected/checkoutDetails/checkout_details.dart';
import 'package:mon_service/theme/theme.dart';

class ServiceSelected extends StatefulWidget {
  final int index;
  final String image;
  final String name;
  const ServiceSelected(
      {Key? key, required this.index, required this.image, required this.name})
      : super(key: key);

  @override
  _ServiceSelectedState createState() => _ServiceSelectedState();
}

class _ServiceSelectedState extends State<ServiceSelected> {
  int _selectedIndex = 0;
  int selectedTopImagesIndex = 0;
  bool basicSelected = false;
  bool standardSelected = false;
  bool premiumSelected = true;
  bool showAllReviews = false;
  PageController _pageController = PageController();
  @override
  void initState() {
    _selectedIndex = widget.index;
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.appBackgroundColor,
          bottomNavigationBar: bottomNavigationBar(screenWidth),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: screenWidth * 5,
                ),
              )),
          body: Stack(
            children: [topBlock(screenWidth), bottomBlock(screenWidth)],
          )),
    );
  }

  Widget topBlock(screenWidth) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .36,
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .36,
              width: double.infinity,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      selectedTopImagesIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .36,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(index == 1
                                  ? 'assets/person_image.png'
                                  : 'assets/${widget.image}'))),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .36,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
                        .copyWith(right: screenWidth * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('tao');
                            setState(() {
                              _pageController.animateToPage(
                                  _pageController.page!.toInt() - 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            });
                          },
                          child: Container(
                            height: screenWidth * 9,
                            width: screenWidth * 9,
                            color: Colors.white.withOpacity(0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: screenWidth * 7,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('tao');
                            setState(() {
                              _pageController.animateToPage(
                                  _pageController.page!.toInt() + 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            });
                          },
                          child: Container(
                            height: screenWidth * 9,
                            width: screenWidth * 9,
                            color: Colors.white.withOpacity(0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: screenWidth * 7,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          margin: EdgeInsets.all(screenWidth)
                              .copyWith(bottom: screenWidth * 8),
                          height: screenWidth * 2.3,
                          width: screenWidth * 2.3,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedTopImagesIndex == i
                                  ? Colors.white
                                  : Colors.white.withOpacity(.6)),
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomBlock(screenWidth) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .61,
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .56,
                    padding: EdgeInsets.only(top: screenWidth * 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: theme.appBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 6),
                            topRight: Radius.circular(screenWidth * 6))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imageAndDetailsBlock(screenWidth),
                          showAllReviews
                              ? allReviews(screenWidth)
                              : packageDetailsBlock(screenWidth),
                          SizedBox(
                            height: screenWidth * 10,
                          )
                        ],
                      ),
                    ),
                  )),
              circleBoxHourlyPrice(screenWidth)
            ],
          ),
        ));
  }

  Widget packageDetailsBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        servicesDescriptionBlock(screenWidth),
        pricesTabs(screenWidth),
        pricesTabsDescriptionBlock(screenWidth),
        confirmButton(screenWidth),
        reviews(screenWidth),
        moreYouWillLikeBlock(screenWidth),
      ],
    );
  }

  Widget allReviews(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

  Widget circleBoxHourlyPrice(screenWidth) {
    return Positioned(
        right: screenWidth * 6,
        top: 0,
        child: Container(
          height: screenWidth * 20,
          width: screenWidth * 20,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(color: theme.mainColor, shape: BoxShape.circle),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text('\$24', screenWidth * 5, Colors.white,
                    fontWeight: FontWeight.bold),
                text('Hourly', screenWidth * 2.7, Colors.white,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
        ));
  }

  Widget imageAndDetailsBlock(screenWidth) {
    return Container(
      padding: EdgeInsets.only(
          top: screenWidth * 5, left: screenWidth * 4, right: screenWidth * 4),
      height: screenWidth * 23,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: screenWidth * 15,
            height: screenWidth * 15,
            child: Stack(
              children: [
                Container(
                  width: screenWidth * 16,
                  height: screenWidth * 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.darkTextColor,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/person_image.png')),
                  ),
                ),
                Positioned(
                    bottom: screenWidth,
                    right: screenWidth,
                    child: Container(
                      height: screenWidth * 2.5,
                      width: screenWidth * 2.5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green.shade400),
                    ))
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(screenWidth * 3)
                .copyWith(top: screenWidth * 1.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('Scott adkins', screenWidth * 3.9, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                    text('Photographer', screenWidth * 2.5, theme.darkTextColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: screenWidth * .7,
                    ),
                    text('Replies within a few hours', screenWidth * 2.3,
                        theme.mainColor,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 2, vertical: screenWidth * 1.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 40),
                color: theme.mainColor),
            child: Row(
              children: [
                text('Chat now', screenWidth * 2.7, Colors.white,
                    fontWeight: FontWeight.w500),
                SizedBox(width: screenWidth),
                SizedBox(
                  height: screenWidth * 3.5,
                  width: screenWidth * 3.5,
                  child: Image.asset('assets/chat_icon.png'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget servicesDescriptionBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 4),
          child: text(
              'Photography Services', screenWidth * 5.5, theme.darkTextColor,
              fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2),
          child: text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.',
              screenWidth * 3,
              theme.darkTextColor,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget pricesTabs(screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 8),
      child: SizedBox(
        height: screenWidth * 15,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  premiumSelected = true;
                  basicSelected = false;
                  standardSelected = false;
                });
              },
              child: Container(
                color: theme.appBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('\$300', screenWidth * 5, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: 2,
                      decoration: BoxDecoration(
                          color: premiumSelected
                              ? theme.mainColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(screenWidth * 4)),
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  premiumSelected = false;
                  basicSelected = false;
                  standardSelected = true;
                });
              },
              child: Container(
                color: theme.appBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('\$100', screenWidth * 5, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: 2,
                      decoration: BoxDecoration(
                          color: standardSelected
                              ? theme.mainColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(screenWidth * 4)),
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  premiumSelected = false;
                  basicSelected = true;
                  standardSelected = false;
                });
              },
              child: Container(
                color: theme.appBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text('\$40', screenWidth * 5, theme.darkTextColor,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: screenWidth * 2,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                      height: 2,
                      decoration: BoxDecoration(
                          color: basicSelected
                              ? theme.mainColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(screenWidth * 4)),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget pricesTabsDescriptionBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenWidth * 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
          child: text('Premium Package', screenWidth * 4, theme.darkTextColor,
              fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2, bottom: screenWidth),
          child: text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.',
              screenWidth * 2.6,
              theme.darkTextColor,
              fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Lorem ipsum', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('Unlimited', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Lorem ipsum', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('24 Hours', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Lorem ipsum', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              text('5', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Lorem ipsum', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: screenWidth * 3,
                width: screenWidth * 3,
                child: Image.asset('assets/done_icon.png'),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Lorem ipsum', screenWidth * 3, theme.darkTextColor,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: screenWidth * 3,
                width: screenWidth * 3,
                child: Image.asset('assets/done_icon.png'),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget confirmButton(screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CheckoutDetails()));
      },
      child: Container(
        height: screenWidth * 12.5,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(screenWidth * 4).copyWith(top: screenWidth * 8),
        decoration: BoxDecoration(
          color: theme.mainColor,
          borderRadius: BorderRadius.circular(screenWidth * 100),
        ),
        child: Text(
          'CONFIRM (\$300)',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: theme.whiteColor,
              fontSize: screenWidth * 4,
              fontWeight: FontWeight.bold),
        ),
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
              Row(
                children: [
                  text('Reviews', screenWidth * 4, theme.darkTextColor,
                      fontWeight: FontWeight.bold),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                    size: screenWidth * 4,
                  ),
                  text('(5.0)', screenWidth * 3, theme.lightTextColor,
                      fontWeight: FontWeight.w500),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAllReviews = true;
                  });
                },
                child: text('See all', screenWidth * 3, theme.mainColor,
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

  Widget moreYouWillLikeBlock(screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 4)
              .copyWith(top: screenWidth * 8),
          child: text('More you\'ll like', screenWidth * 4, theme.darkTextColor,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: screenWidth * 2,
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
                  width: screenWidth * 45,
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

  Widget bottomNavigationBar(screenWidth) {
    return SizedBox(
      height: screenWidth * 14,
      child: BottomNavigationBar(
          selectedFontSize: 0,
          // unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Dashboard(index: _selectedIndex)));
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.blueColor,
          unselectedItemColor: Colors.grey.shade500,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/home.png',
                    color: _selectedIndex == 0
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/chat.png',
                    color: _selectedIndex == 1
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/search.png',
                    color: _selectedIndex == 2
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/notification.png',
                    color: _selectedIndex == 3
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/person.png',
                    color: _selectedIndex == 4
                        ? theme.mainColor
                        : Colors.grey.shade400,
                    fit: BoxFit.contain,
                  ),
                )),
          ]),
    );
  }
}
