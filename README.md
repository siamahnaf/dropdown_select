# Flutter Dropdown Select

A Flutter dropdown widget with Material Design styling, supporting single/multi-select options and tooltips for enhanced usability.

> This is a fork of [dropdown_textfield](https://github.com/srtraj/dropdown_textfield) adding typescript support and fixing nextjs implementation!

## Key Features

1. Searchable dropdown
2. Single & multi-selection
3. Material design styling
4. Totally customizable UI
5. Tooltip for multi selection dropdown item

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

### Properties
- **dropdownContainerDecoration**: Customize main dropdown decorations.
- **initialValue**: Sets the initial value. If null or not in the `dropDownList`, it will not display any value.
- **dropDownList**: A list of dropdown values of type `<DropDownValueModel>`.
- **onChanged**: Listens for item selection changes. Returns a single `DropDownValueModel` object for single selection dropdown, and a list of `DropDownValueModel` objects for multi-selection dropdown.
- **textFieldDecoration**: Overrides the default text field decoration.
- **dropDownIconProperty**: Customizes the dropdown icon size and color.
- **isEnabled**: Set to `false` to disable the text field. Default value is `true`.
- **enableSearch**: Set to `true` to enable the search option in the dropdown. Currently available only for single selection dropdown.
- **displayCompleteItem**: Set to `true` to display the complete list of selected items in the text field. Otherwise, it will display as "number_of_items selected".
- **dropDownItemCount**: Maximum number of dropdown items to display. Default value is 6.
- **searchKeyboardType**: Overrides the default search keyboard type. Applicable only if `enableSearch=true`.
- **searchTextStyle**: Text style for the search text field.
- **searchAutofocus**: Set to `true` to autofocus the search text field. Applicable only if `enableSearch=true`. Default value is `false`.
- **searchShowCursor**: Set to `false` to hide the cursor from the search text field. Applicable only if `enableSearch=true`.
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