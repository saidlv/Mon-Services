import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

class languageSelectionDropDown extends StatefulWidget {
  const languageSelectionDropDown({Key? key}) : super(key: key);

  @override
  _languageSelectionDropDownState createState() =>
      _languageSelectionDropDownState();
}

class _languageSelectionDropDownState extends State<languageSelectionDropDown> {
  List<String> listOfLanguages = ['English', 'Portuguese', 'Polish'];
  String languageSelected = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 4),
      child: DropdownButton(
          iconEnabledColor: theme.darkTextColor,
          isExpanded: true,
          style: textStyle(
              color: theme.darkTextColor, fontSize: screenWidth * 3.5),
          hint: Text(
              languageSelected.isEmpty
                  ? 'Select your language'
                  : languageSelected,
              style: textStyle(
                  color: languageSelected.isEmpty
                      ? theme.lightTextColor
                      : Colors.grey.shade900,
                  fontSize: screenWidth * 3.5)),
          onChanged: (val) {
            setState(() {
              languageSelected = val.toString();
            });
          },
          items: [
            for (int i = 0; i < listOfLanguages.length; i++)
              DropdownMenuItem(
                  value: listOfLanguages[i], child: Text(listOfLanguages[i]))
          ]),
    );
  }
}
