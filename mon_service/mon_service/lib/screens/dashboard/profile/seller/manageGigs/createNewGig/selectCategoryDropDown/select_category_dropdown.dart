import 'package:flutter/material.dart';
import 'package:mon_service/globalWidgets/textWidget/text_widget.dart';
import 'package:mon_service/responsiveBloc/size_config.dart';
import 'package:mon_service/theme/theme.dart';

class SelectCategoryDropDown extends StatefulWidget {
  const SelectCategoryDropDown({Key? key}) : super(key: key);

  @override
  _SelectCategoryDropDownState createState() => _SelectCategoryDropDownState();
}

class _SelectCategoryDropDownState extends State<SelectCategoryDropDown> {
  List<String> listOfCategories = [
    'Developer',
    'Designer',
    'Writer',
    'Teacher',
    'Animation'
  ];
  String languageSelected = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return DropdownButton(
        underline: Container(
          height: 1,
          color: theme.lightTextColor.withOpacity(.8),
        ),
        iconEnabledColor: theme.darkTextColor,
        isExpanded: true,
        style:
            textStyle(color: theme.darkTextColor, fontSize: screenWidth * 3.4),
        hint: Text(
            languageSelected.isEmpty ? 'Select category' : languageSelected,
            style: textStyle(
                color: languageSelected.isEmpty
                    ? theme.lightTextColor.withOpacity(.7)
                    : theme.darkTextColor,
                fontSize: screenWidth * 3.4)),
        onChanged: (val) {
          setState(() {
            languageSelected = val.toString();
          });
        },
        items: [
          for (int i = 0; i < listOfCategories.length; i++)
            DropdownMenuItem(
                value: listOfCategories[i], child: Text(listOfCategories[i]))
        ]);
  }
}
