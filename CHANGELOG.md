## 3.0.5
* **New:** `suffixIconColor` — background color of the suffix icon area.
* **New:** `suffixIconPadding` — padding inside the suffix icon area. Supports values down to 0.
* **Fixed:** Suffix icon padding now works at any value (including 0) by removing Flutter's default 48×48 minimum touch target constraint.

## 3.0.4
* Dropdown container now clipped.

## 3.0.3
* Small bug fixing and added gif demo.

## 3.0.2
* Small bug fixing and added gif demo.

## 3.0.1
* Small bug fixing and added gif demo.

## 3.0.0

* **New:** `selectBorderRadius` — customize the border radius of the selected item highlight (single-select).
* **New:** `selectTextColor` — override the text color of the selected item while keeping all other text styling. Defaults to `Colors.white`.
* **New:** `dropdownContainerPadding` — control padding inside the dropdown container. Defaults to `EdgeInsets.symmetric(horizontal: 6, vertical: 6)`.
* **Improved:** Replaced old height-expand animation with a smooth scale (0.95→1.0) + translateY + fade animation using `easeOutCubic`.
* **Improved:** Dropdown list items now use `minHeight` instead of fixed height, preventing descender glyphs (g, y, p) from being clipped and allowing long text to wrap correctly.
* **Improved:** Reduced default `ListPadding` from 15/15/10/10 to 8/8/8/8 for a more compact look.
* **Fixed:** Removed `FocusScopeNode` memory leak in single-select (node was created but never added to the widget tree or disposed).
* **Fixed:** Removed dead `toolTipDialogue` and `showAnimatedAlertDialog` methods from tooltip widget.
* **Chore:** Replaced `Function` typed equality helpers with inline `DeepCollectionEquality` calls.
* **Chore:** Improved strong typing throughout (`VoidCallback`, `List<String>`, `CurvedAnimation` disposal).
* **License:** Switched to MIT license.

## 2.0.8

* Add many bug fixing
