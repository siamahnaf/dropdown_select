import 'package:flutter/material.dart';
import 'package:dropdown_select/dropdown_select.dart';

class DropdownSelectExample extends StatelessWidget {
  const DropdownSelectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownSelect(
            clearOption: true,
            enableSearch: true,
            clearIconProperty: IconProperty(color: Colors.green),
            searchTextStyle: const TextStyle(color: Colors.red),
            searchDecoration: const InputDecoration(
                hintText: "enter your custom hint text here"),
            validator: (value) {
              if (value == null) {
                return "Required field";
              } else {
                return null;
              }
            },
            dropDownItemCount: 6,
            dropDownList: const [
              DropDownValueModel(name: 'name1', value: "value1"),
              DropDownValueModel(
                  name: 'name2',
                  value: "value2",
                  toolTipMsg:
                      "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              DropDownValueModel(name: 'name3', value: "value3"),
              DropDownValueModel(
                  name: 'name4',
                  value: "value4",
                  toolTipMsg:
                      "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              DropDownValueModel(name: 'name5', value: "value5"),
              DropDownValueModel(name: 'name6', value: "value6"),
              DropDownValueModel(name: 'name7', value: "value7"),
              DropDownValueModel(name: 'name8', value: "value8"),
            ],
            onChanged: (val) {},
          )
        ],
      ),
    );
  }
}
