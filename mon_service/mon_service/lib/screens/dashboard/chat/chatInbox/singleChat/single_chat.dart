import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/screens/dashboard/chat/chatInbox/singleChat/strings.dart';
import 'package:mon_service/theme/theme.dart';

class SingleChat extends StatefulWidget {
  const SingleChat({Key? key}) : super(key: key);

  @override
  _SingleChatState createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(screenWidth),
        body: Stack(
          children: [
            allMessages(screenWidth),
            sendMessageBlock(screenWidth),
          ],
        ),
      ),
    );
  }

  AppBar appBar(screenWidth) {
    return AppBar(
      toolbarHeight: screenWidth * 40,
      automaticallyImplyLeading: false,
      backgroundColor: theme.appBackgroundColor,
      elevation: 0,
      title: SizedBox(
        height: screenWidth * 45,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: theme.darkTextColor,
                      size: screenWidth * 5,
                    ),
                  ),
                  SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: screenWidth * 5,
            ),
            SizedBox(
              height: screenWidth * 17,
              width: screenWidth * 17,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 100),
                  child: Image.asset(
                    'assets/person_image.png',
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: screenWidth * 3,
            ),
            text('Sujen Matin', screenWidth * 4, theme.lightTextColor,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
    );
  }

  Widget sendMessageBlock(screenWidth) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                screenWidth * 4, 0, screenWidth * 4, screenWidth * 2),
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: screenWidth * 1.4, horizontal: screenWidth * 3),
            decoration: BoxDecoration(
              boxShadow: theme.boxShadow,
              color: theme.appBackgroundColor,
              borderRadius: BorderRadius.circular(screenWidth * 3),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 2),
                    child: TextField(
                      maxLength: null,
                      maxLines: null,
                      style: textStyle(
                          fontSize: screenWidth * 3.7,
                          fontWeight: FontWeight.w400,
                          color: theme.darkTextColor),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type message here',
                          hintStyle: textStyle(
                              fontSize: screenWidth * 3.7,
                              fontWeight: FontWeight.w400,
                              color: theme.lightTextColor.withOpacity(.6))),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: screenWidth * 8.5,
                      width: screenWidth * 8.5,
                      padding: EdgeInsets.all(screenWidth * 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: theme.mainColor,
                          shape: BoxShape.circle,
                          boxShadow: theme.boxShadow),
                      child: Image.asset(
                        'assets/attachment.png',
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: screenWidth * 1.5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: screenWidth * 8.5,
                      width: screenWidth * 8.5,
                      padding: EdgeInsets.all(screenWidth * 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: theme.mainColor,
                          shape: BoxShape.circle,
                          boxShadow: theme.boxShadow),
                      child: Image.asset(
                        'assets/camera.png',
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: screenWidth * 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                      height: screenWidth * 8,
                      width: screenWidth * 8,
                      child: Image.asset('assets/send.png')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget allMessages(screenWidth) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < strings().listOfMessages.length; i++)
            Padding(
              padding:
                  EdgeInsets.all(screenWidth * 4).copyWith(bottom: screenWidth),
              child: Row(
                mainAxisAlignment: strings().listOfMessages[i].isMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  !strings().listOfMessages[i].isMe
                      ? SizedBox()
                      : text('12:15', screenWidth * 3,
                          theme.lightTextColor.withOpacity(.6),
                          fontWeight: FontWeight.w600),
                  Container(
                    margin: EdgeInsets.only(
                        right: strings().listOfMessages[i].isMe
                            ? 0
                            : screenWidth * 2,
                        left: strings().listOfMessages[i].isMe
                            ? screenWidth * 2
                            : 0),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .6),
                    padding: EdgeInsets.all(screenWidth * 3),
                    decoration: BoxDecoration(
                        color: strings().listOfMessages[i].isMe
                            ? theme.mainColor
                            : theme.mainColor.withOpacity(.2),
                        borderRadius:
                            BorderRadius.circular(screenWidth * 4).copyWith(
                          bottomLeft: strings().listOfMessages[i].isMe
                              ? Radius.circular(screenWidth * 4)
                              : Radius.circular(0),
                          bottomRight: strings().listOfMessages[i].isMe
                              ? Radius.circular(0)
                              : Radius.circular(screenWidth * 4),
                        )),
                    child: Column(
                      children: [
                        text(
                            strings().listOfMessages[i].description,
                            screenWidth * 3,
                            strings().listOfMessages[i].isMe
                                ? Colors.white
                                : theme.mainColor,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                  strings().listOfMessages[i].isMe
                      ? SizedBox()
                      : text('12:15', screenWidth * 3,
                          theme.lightTextColor.withOpacity(.6),
                          fontWeight: FontWeight.w600),
                ],
              ),
            ),
          SizedBox(height: screenWidth * 30)
        ],
      ),
    );
  }
}
