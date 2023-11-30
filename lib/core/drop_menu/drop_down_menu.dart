import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class DropDownMenu extends StatefulWidget {
  final List<String?> items;
  final List<dynamic>? actualList;
  final String hint;
  final ValueSetter<dynamic> onSelect;
  final String? title;
  final String? initialValue;
  final bool matchTextField;
  final bool isMenu;
  final double width;
  final double fontsize;

  const DropDownMenu(
      {Key? key,
      this.width = 300,
      required this.items,
      required this.hint,
      required this.onSelect,
      this.fontsize = 16,
      this.actualList,
      this.initialValue,
      this.title,
      this.isMenu = true,
      this.matchTextField = false})
      : super(key: key);
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryColor,
      ),
      child: Padding(
        padding: widget.isMenu
            ? const EdgeInsets.symmetric(horizontal: 10)
            : const EdgeInsets.symmetric(horizontal: 0),
        child: DropdownButton<String>(
            dropdownColor: primaryColor,
            borderRadius: BorderRadius.circular(10),
            menuMaxHeight: 300,
            // alignment: Alignment.centerLeft,
            icon: widget.isMenu
                ? Icon(
                    CupertinoIcons.chevron_down,
                    size: 7,
                    // color: k,
                  )
                : Icon(
                    Icons.check_box_outline_blank_sharp,
                    color: backgroundColor,
                    size: 1,
                  ),
            // dropdownColor: kDark1,
            isExpanded: widget.isMenu,
            value: (widget.items.contains(widget.initialValue) &&
                    _selectedItem == null)
                ? widget.initialValue
                : null,
            underline: SizedBox(),
            items: widget.items.map((String? val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(
                  val!,
                  style: t1.copyWith(fontSize: widget.fontsize),
                ),
              );
            }).toList(),
            hint: Text(
              _selectedItem ?? widget.hint,
              style: t1.copyWith(fontSize: widget.fontsize),
            ),
            onChanged: (newVal) {
              if (widget.isMenu) _selectedItem = newVal;
              if ((widget.actualList)?.isNotEmpty ?? false) {
                widget
                    .onSelect(widget.actualList![widget.items.indexOf(newVal)]);
              } else {
                widget.onSelect(newVal);
              }
              this.setState(() {});
            }),
      ),
    );
  }
}
