# Flutter Dropdown Select

A Flutter dropdown widget with Material Design styling, supporting single/multi-select options and tooltips for enhanced usability.

> This is a fork of [dropdown_textfield](https://github.com/srtraj/dropdown_textfield) by adding many community wanted features

- Searchable dropdown
- Single & multi-selection
- Material design styling
- Totally customizable UI
- Tooltip for multi selection dropdown item

## Usage

```dart
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
```

## Demo

<table>
  <tr>
    <th>Single Dropdown</th>
    <th>Single Dropdown with Search Option</th>
    <th>Single Dropdown with Clear Option</th>
  </tr>
  <tr>
    <td><img src="https://github.com/srtraj/dropdown_textfield/raw/development/example/examples/single-dropdown.gif" alt="Single Dropdown" height="500" width="260"></td>
    <td><img src="https://github.com/srtraj/dropdown_textfield/raw/development/example/examples/single-dropdown-with-search-option.gif" alt="Single Dropdown with Search Option" height="500" width="260"></td>
    <td><img src="https://github.com/srtraj/dropdown_textfield/raw/development/example/examples/single-dropdown-with-clearOption.gif" alt="Single Dropdown with Clear Option" height="500" width="260"></td>
  </tr>
</table>

<table>
  <tr>
    <th>Multiple Dropdown</th>
    <th>Multiple Dropdown with All Selected Items</th>
  </tr>
  <tr>
    <td><img src="https://github.com/srtraj/dropdown_textfield/raw/development/example/examples/multiselection-dropdown.gif" alt="Multiple Dropdown" height="500" width="260"></td>
    <td><img src="https://github.com/srtraj/dropdown_textfield/raw/development/example/examples/multiselection-with-all-selected-items.gif" alt="Multiple Dropdown with All Selected Items" height="500" width="260"></td>
  </tr>
</table>

## Usage

### Controllers
You need to use `SingleValueDropDownController` for single dropdown and `MultiValueDropDownController` for multiple dropdown.

## Properties

###  Single Select

- **controller**: Single and multiple dropdown controller
- **initialValue**: Sets the initial value. If null or not in the `dropDownList`, it will not display any value.
- **dropDownList**: A list of dropdown values of type `<DropDownValueModel>`.
- **padding**: Main widget padding
- **textStyle**: `TextFormField` basic text style
- **onChanged**: Listens for item selection changes.
- **validator**: Validator for validating `dropdown_select`
- **selectColor**: Background color for dropdown select item from list. Highlight color for selected item from DropdownList.
- **isEnabled**: Set to `false` to disable the text field. Default value is `true`.
- **enableSearch**: Set to `true` to enable the search option in the dropdown. Currently available only for single selection dropdown.
- **readOnly**: Set to `false` to enable writing on text field.
- **dropdownContainerDecoration**: Customize main dropdown decorations.
- **textFieldDecoration**: Overrides the default text field decoration.
- **dropDownIconProperty**: Customizes the dropdown icon size and color. It support `icon`, `color` and `size` property
- **dropDownItemCount**: Maximum number of dropdown items to display. Default value is 6.
- **searchTextStyle**: Text style for the search text field.
- **searchFocusNode**: Focus node for search text field.
- **textFieldFocusNode**: Focus node for main text field.
- **searchAutofocus**: To enable or disable auto focus for search text field.
- **searchDecoration**: Input decoration for search text field.
- **searchShowCursor**: Show or hide cursor for search text field.
- **searchKeyboardType**: Keyboard type for search text field
- **listSpace**: Spacing for list on DropdownList. Default is `0`
- **clearOption**: Enable or disable clear button
- **clearIconProperty**: Clear icon property. Same as `dropdownIconProperty`
- **listPadding**: Padding for dropdown list items.
- **listTextStyle**: Text style for dropdown list items.
- **selectListTextStyle**: Text style for dropdown selected item
- **keyboardType**: Keyboard type for main text field
- **autovalidateMode**: To enable auto validation


### Multi Select
- **controller**: Single and multiple dropdown controller
- **displayCompleteItem**: Set to true to display the complete list of selected items in the text field. Otherwise, it will display as "number_of_items selected".
- **initialValue**: Sets the initial value. If null or not in the `dropDownList`, it will not display any value.
- **dropDownList**: A list of dropdown values of type `<DropDownValueModel>`.
- **padding**: Main widget padding
- **textStyle**: `TextFormField` basic text style
- **onChanged**: Listens for item selection changes.
- **validator**: Validator for validating `dropdown_select`
- **isEnabled**: Set to `false` to disable the text field. Default value is `true`.
- **dropdownContainerDecoration**: Customize main dropdown decorations.
- **dropDownIconProperty**: Customizes the dropdown icon size and color. It support `icon`, `color` and `size` property
- **dropDownItemCount**: Maximum number of dropdown items to display. Default value is 6.
- **searchFocusNode**: Focus node for search text field.
- **textFieldFocusNode**: Focus node for main text field.
- **listSpace**: Spacing for list on DropdownList. Default is `0`
- **clearOption**: Enable or disable clear button
- **clearIconProperty**: Clear icon property. Same as `dropdownIconProperty`
- **clearIconProperty**: Customizes the clear icon size and color.
- **submitButtonText**: Text for the multi-dropdown submit button.
- **submitButtonColor**: Color of the multi-dropdown submit button.
- **submitButtonTextStyle**: Text style for the multi-dropdown submit button.
- **listPadding**: Padding for dropdown list items.
- **listTextStyle**: Text style for dropdown list items.
- **checkBoxProperty**: Customizes the properties of multiple checkboxes.
- **autovalidateMode**: To enable auto validation

### Re-arranged By Siam Ahnaf
https://siamahnaf.com