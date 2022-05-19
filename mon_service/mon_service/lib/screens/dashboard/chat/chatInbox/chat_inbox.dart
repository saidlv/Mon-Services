import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/chat/chatInbox/singleChat/single_chat.dart';
import 'package:mon_service/screens/dashboard/searchCategories/searchSubCategories/search_sub_categories.dart';
import 'package:mon_service/theme/theme.dart';

class ChatInbox extends StatefulWidget {
  final int selectedIndex;

  ChatInbox({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<ChatInbox> createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  List<dynamic> selectedList = [];
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Stack(
      children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
                itemCount: listOfChats.length,
                padding: EdgeInsets.only(top: screenWidth * 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      setState(() {
                        listOfChats[index]['selected'] =
                            !listOfChats[index]['selected'];
                        if (listOfChats[index]['selected']) {
                          selectedList.add(listOfChats[index]);
                        } else {
                          selectedList.remove(listOfChats[index]);
                        }
                      });
                    },
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleChat()));
                    },
                    child: Column(
                      children: [
                        Container(
                          color: listOfChats[index]['selected']
                              ? theme.mainColor.withOpacity(.2)
                              : theme.appBackgroundColor,
                          padding: EdgeInsets.only(
                              top: screenWidth * 5,
                              left: screenWidth * 4,
                              right: screenWidth * 4),
                          height: screenWidth * 23,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                            image: AssetImage(
                                                'assets/${listOfChats[index]['image']}')),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: screenWidth,
                                        right: screenWidth,
                                        child: Container(
                                          height: screenWidth * 2.5,
                                          width: screenWidth * 2.5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green.shade400),
                                        ))
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(screenWidth * 3)
                                    .copyWith(top: screenWidth),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                            listOfChats[index]['name'],
                                            screenWidth * 3.9,
                                            theme.darkTextColor,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          height: screenWidth * .7,
                                        ),
                                        text(
                                            listOfChats[index]['description'],
                                            screenWidth * 2.8,
                                            theme.darkTextColor,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                              text(listOfChats[index]['date'],
                                  screenWidth * 2.8, theme.darkTextColor,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: .5,
                          color: theme.lightTextColor.withOpacity(.5),
                        )
                      ],
                    ),
                  );
                })),
        selectedList.isEmpty
            ? SizedBox()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(screenWidth * 4),
                  height: screenWidth * 14,
                  width: screenWidth * 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: theme.mainColor,
                      borderRadius: BorderRadius.circular(screenWidth)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              listOfChats.removeWhere(
                                  (element) => element['selected']);
                              selectedList.removeWhere(
                                  (element) => element['selected']);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 5,
                                  width: screenWidth * 5,
                                  child: Image.asset('assets/delete.png'),
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Delete', screenWidth * 2.5, Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 5,
                                  width: screenWidth * 5,
                                  child: Image.asset('assets/done.png'),
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Mark as seen', screenWidth * 2.5,
                                    Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              listOfChats.forEach((element) {
                                element['selected'] = true;
                              });
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: theme.mainColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenWidth * 5,
                                  width: screenWidth * 5,
                                  child: Image.asset('assets/select_all.png'),
                                ),
                                SizedBox(
                                  height: screenWidth,
                                ),
                                text('Select all', screenWidth * 2.5,
                                    Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
      ],
    );
  }

  List<dynamic> listOfChats = [
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
    {
      'name': 'Don john',
      'description':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  et justo',
      'image': 'chat_pic.png',
      'date': '09:45',
      'selected': false
    },
  ];
}
