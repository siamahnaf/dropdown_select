# Flutter Dropdown Select

A Flutter dropdown widget with Material Design styling, supporting single/multi-select options and tooltips for enhanced usability.

> This is a fork of [dropdown_textfield](https://github.com/srtraj/dropdown_textfield) adding typescript support and fixing nextjs implementation!

- Searchable dropdown
- Single & multi-selection
- Material design styling
- Totally customizable UI
- Tooltip for multi selection dropdown item

## Installation
Copy dependencies to your `pubspec.yaml`

```yaml
dependencies:
  dropdown_select: ^1.2.1
```

or copy and run following command

```bash
flutter pub add dropdown_select
```

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
https://lh3.googleusercontent.com/d/11eJ_4gAbcT8-NTNKtA4m94jvguEn7zZJ

https://drive.google.com/file/d/11eJ_4gAbcT8-NTNKtA4m94jvguEn7zZJ/view?usp=sharing

<table>
  <tr>
    <th>Single Dropdown</th>
    <th>Single Dropdown with Search Option</th>
    <th>Single Dropdown with Clear Option</th>
  </tr>
  <tr>
    <td><img src="https://lh3.googleusercontent.com/d/1cDNN7XGCIMtab7uitXwLhW8sTooZG-Df" alt="Single Dropdown" height="500" width="260"></td>
    <td><img src="https://lh3.googleusercontent.com/d/1Bg5a6INkB_aC2RhhnSFY44rl30jKWJ_o" alt="Single Dropdown with Search Option" height="500" width="260"></td>
    <td><img src="https://lh3.googleusercontent.com/d/1DL1RV_pt2puCR7uoY0HyGd8gmg5MrqVj" alt="Single Dropdown with Clear Option" height="500" width="260"></td>
  </tr>
</table>

<table>
  <tr>
    <th>Multiple Dropdown</th>
    <th>Multiple Dropdown with All Selected Items</th>
  </tr>
  <tr>
    <td><img src="https://lh3.googleusercontent.com/d/11eJ_4gAbcT8-NTNKtA4m94jvguEn7zZJ" alt="Multiple Dropdown" height="500" width="260"></td>
    <td><img src="https://lh3.googleusercontent.com/d/1Fr-5VkJ-b1uI2pwqlbutMs5yzpeI_LCe" alt="Multiple Dropdown with All Selected Items" height="500" width="260"></td>
  </tr>
</table>

## Usage

### Controllers
You need to use `SingleValueDropDownController` for single dropdown and `MultiValueDropDownController` for multiple dropdown.

### Properties
- **dropdownContainerDecoration**: Customize main dropdown decorations.
- **initialValue**: Sets the initial value. If null or not in the `dropDownList`, it will not display any value.
- **dropDownList**: A list of dropdown values of type `<DropDownValueModel>`.
- **onChanged**: Listens for item selection changes. Returns a single `DropDownValueModel` object for single selection dropdown, and a list of `DropDownValueModel` objects for multi-selection dropdown.
- **textFieldDecoration**: Overrides the default text field decoration.
- **dropDownIconProperty**: Customizes the dropdown icon size and color.
- **isEnabled**: Set to `false` to disable the text field. Default value is `true`.
- **enableSearch**: Set to `true` to enable the search option in the dropdown. Currently available only for single selection dropdown.
- **dropDownItemCount**: Maximum number of dropdown items to display. Default value is 6.
- **searchKeyboardType**: Overrides the default search keyboard type. Applicable only if `enableSearch=true`.
- **searchTextStyle**: Text style for the search text field.
- **searchAutofocus**: Set to `true` to autofocus the search text field. Applicable only if `enableSearch=true`. Default value is `false`.
- **searchShowCursor**: Set to `false` to hide the cursor from the search text field. Applicable only if `enableSearch=true`.
- **searchDecoration**: Search bar decoration.
- **clearOption**: Set to `false` to hide the clear suffix icon button from the text field.
- **clearIconProperty**: Customizes the clear icon size and color.
- **listSpace**: Space between the text field and the list. Default value is 0.
- **listPadding**: Padding for dropdown list items.
- **submitButtonText**: Text for the multi-dropdown submit button.
- **submitButtonColor**: Color of the multi-dropdown submit button.
- **submitButtonTextStyle**: Text style for the multi-dropdown submit button.
- **listTextStyle**: Text style for dropdown list items.
- **checkBoxProperty**: Customizes the properties of multiple checkboxes.

# Forking By Siam Ahnaf
https://siamahnaf.com