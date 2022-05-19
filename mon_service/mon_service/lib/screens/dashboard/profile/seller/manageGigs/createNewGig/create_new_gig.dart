import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/profile/seller/manageGigs/createNewGig/selectCategoryDropDown/select_category_dropdown.dart';

import 'package:mon_service/theme/theme.dart';

class CreateNewGig extends StatefulWidget {
  @override
  _CreateNewGigState createState() => _CreateNewGigState();
}

class _CreateNewGigState extends State<CreateNewGig> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;
  bool premiumSelected = true;
  bool standardSelected = false;
  bool basicSelected = false;

  List<dynamic> picturesList = [];

  void getImageFromGallery() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);

      picturesList.add({'imageFile': _imageFile, 'selected': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            appBar: appBar(screenWidth),
            backgroundColor: theme.appBackgroundColor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: screenWidth * 3,
                      ),
                      SelectCategoryDropDown(),
                      SizedBox(
                        height: screenWidth * 3,
                      ),
                      TextField(
                        maxLines: null,
                        style: textStyle(
                          fontSize: screenWidth * 3.3,
                          color: theme.darkTextColor,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Name The Service you are providing',
                          hintStyle: textStyle(
                            fontSize: screenWidth * 3.3,
                            color: theme.lightTextColor.withOpacity(.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 5,
                      ),
                      TextField(
                        maxLines: null,
                        style: textStyle(
                          fontSize: screenWidth * 3.3,
                          color: theme.darkTextColor,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Describe your service in detail',
                          hintStyle: textStyle(
                            fontSize: screenWidth * 3.3,
                            color: theme.lightTextColor.withOpacity(.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 8,
                      ),
                      text('Packages', screenWidth * 4.5, theme.mainColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: screenWidth * 3,
                      ),
                      packagesTabs(screenWidth),
                      SizedBox(
                        height: screenWidth * 6,
                      ),
                      SizedBox(
                        width: screenWidth * 23,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: textStyle(
                            fontSize: screenWidth * 3.3,
                            color: theme.darkTextColor,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Total cost',
                            hintStyle: textStyle(
                              fontSize: screenWidth * 3.3,
                              color: theme.lightTextColor.withOpacity(.7),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 6,
                      ),
                      TextField(
                        maxLines: null,
                        style: textStyle(
                          fontSize: screenWidth * 3.3,
                          color: theme.darkTextColor,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Describe the package',
                          hintStyle: textStyle(
                            fontSize: screenWidth * 3.3,
                            color: theme.lightTextColor.withOpacity(.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 8,
                      ),
                      text('Select deliverables', screenWidth * 4,
                          theme.darkTextColor,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: screenWidth * 4,
                      ),
                      for (int i = 0; i < selectDeliverablesList.length; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectDeliverablesList[i]['selected'] =
                                  !selectDeliverablesList[i]['selected'];
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: screenWidth * 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text(selectDeliverablesList[i]['name'],
                                    screenWidth * 3.3, theme.darkTextColor,
                                    fontWeight: FontWeight.w500),
                                Container(
                                    height: screenWidth * 5,
                                    width: screenWidth * 5,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(screenWidth),
                                        border: Border.all(
                                            color: selectDeliverablesList[i]
                                                    ['selected']
                                                ? theme.mainColor
                                                : theme.lightTextColor)),
                                    child: Icon(
                                      Icons.done,
                                      color: selectDeliverablesList[i]
                                              ['selected']
                                          ? theme.mainColor
                                          : Colors.transparent,
                                      size: screenWidth * 4,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: screenWidth * 5,
                      ),
                      text('Upload Images', screenWidth * 4.5, theme.mainColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: screenWidth * 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenWidth * 6),
                        child: Wrap(
                          children: [
                            for (int i = 0; i < picturesList.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    picturesList[i]['selected'] =
                                        !picturesList[i]['selected'];

                                    // picturesList.forEach((element) {
                                    //   if (element['imageFile'] ==
                                    //       picturesList[i]['imageFile']) {
                                    //   } else {
                                    //     picturesList[i]['selected'] = false;
                                    //   }
                                    // });
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 6,
                                      top: screenWidth * 4),
                                  child: SizedBox(
                                    height: screenWidth * 28,
                                    width: screenWidth * 20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                picturesList.removeAt(i);
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.red.shade600,
                                              size: screenWidth * 4.5,
                                            ),
                                          ),
                                        ),
                                        _imageFile != null
                                            ? SizedBox(
                                                width: screenWidth * 17,
                                                height: screenWidth * 19,
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                          screenWidth)
                                                      .copyWith(
                                                          top:
                                                              screenWidth * .4),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            screenWidth * 2),
                                                    child: Image.file(
                                                      picturesList[i]
                                                          ['imageFile'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                        Row(
                                          children: [
                                            Container(
                                              height: screenWidth * 3.5,
                                              width: screenWidth * 3.5,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: theme.mainColor)),
                                              child: Container(
                                                  margin: EdgeInsets.all(
                                                      screenWidth * .5),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: picturesList[i]
                                                              ['selected']
                                                          ? theme.mainColor
                                                          : Colors
                                                              .transparent)),
                                            ),
                                            SizedBox(
                                              width: screenWidth,
                                            ),
                                            text(
                                                'Make Cover',
                                                screenWidth * 2.6,
                                                theme.mainColor,
                                                fontWeight: FontWeight.w700)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => getImageFromGallery(),
                          child: Image.asset(
                            'assets/upload.png',
                            height: screenWidth * 8,
                            width: screenWidth * 8,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth * 2),
                        child: Divider(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (context) => CheckoutDetails()));
                          },
                          child: Container(
                            height: screenWidth * 12.5,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: screenWidth * 2),
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 8),
                            decoration: BoxDecoration(
                              color: theme.mainColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 100),
                            ),
                            child: Text(
                              'Publish',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.whiteColor,
                                  fontSize: screenWidth * 4,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ])))));
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
          color: theme.mainColor,
          size: screenWidth * 5,
        ),
      ),
      title: text('Create A New Gig', screenWidth * 5, theme.mainColor,
          fontWeight: FontWeight.w700),
    );
  }

  Widget packagesTabs(screenWidth) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                premiumSelected = true;
                standardSelected = false;
                basicSelected = false;
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:
                        premiumSelected ? theme.mainColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(screenWidth * 100)),
                child: text('Premium', screenWidth * 3.7,
                    premiumSelected ? Colors.white : theme.mainColor,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                premiumSelected = false;
                standardSelected = true;
                basicSelected = false;
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:
                        standardSelected ? theme.mainColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(screenWidth * 100)),
                child: text('Standard', screenWidth * 3.7,
                    standardSelected ? Colors.white : theme.mainColor,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                premiumSelected = false;
                standardSelected = false;
                basicSelected = true;
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: basicSelected ? theme.mainColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(screenWidth * 100)),
                child: text('Basic', screenWidth * 3.7,
                    basicSelected ? Colors.white : theme.mainColor,
                    fontWeight: FontWeight.w600)),
          ),
        )
      ],
    );
  }

  List<dynamic> selectDeliverablesList = [
    {'name': 'Source file', 'selected': true},
    {'name': 'Design', 'selected': false},
    {'name': 'Document', 'selected': false},
  ];
}
