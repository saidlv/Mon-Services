import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/searchCategories/searchSubCategories/search_sub_categories.dart';
import 'package:mon_service/theme/theme.dart';

class SearchCategories extends StatelessWidget {
  final int selectedIndex;

  SearchCategories({Key? key, required this.selectedIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: listOfCategories.length,
            padding: EdgeInsets.only(top: screenWidth * 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchSubCategories(
                          index: selectedIndex,
                          image: listOfCategories[index]['image'],
                          name: listOfCategories[index]['name'])));
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 4,
                          vertical: screenWidth * 1.3),
                      height: screenWidth * 20,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(screenWidth),
                            width: screenWidth * 20,
                            padding: EdgeInsets.all(screenWidth * 4.5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.appBackgroundColor,
                                boxShadow: theme.boxShadow),
                            child: Image.asset(
                                'assets/${listOfCategories[index]['image']}'),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(screenWidth * 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(listOfCategories[index]['name'],
                                        screenWidth * 3.9, theme.darkTextColor,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: screenWidth * .7,
                                    ),
                                    text(listOfCategories[index]['description'],
                                        screenWidth * 2.8, theme.darkTextColor,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      height: screenWidth * 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Divider()
                  ],
                ),
              );
            }));
  }

  List<dynamic> listOfCategories = [
    {
      'name': 'Electrical Goods Repair',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'electrical.png'
    },
    {
      'name': 'Moving Service',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'moving.png'
    },
    {
      'name': 'Smart Home',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'home2.png'
    },
    {
      'name': 'Transportation and Logistics',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'transport.png'
    },
    {
      'name': 'Dry cleaning',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'clean.png'
    },
    {
      'name': 'Interior decoration',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'interior.png'
    },
    {
      'name': 'Computer repair & maintenance',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'computer.png'
    },
    {
      'name': 'Cleaning service',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'cleaning.png'
    },
    {
      'name': 'Frameless Glass',
      'description': 'Lorem ipsium yeah whatever',
      'image': 'frameless.png'
    },
  ];
}
