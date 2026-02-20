import 'package:dropdown_select/dropdown_select.dart';
import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection(
      {super.key,
      required this.dropDownList,
      required this.onChanged,
      required this.height,
      required this.enableSearch,
      required this.searchHeight,
      this.searchTextStyle,
      required this.searchFocusNode,
      required this.mainFocusNode,
      this.searchKeyboardType,
      required this.searchAutofocus,
      this.searchShowCursor,
      required this.mainController,
      required this.autoSort,
      required this.listTileHeight,
      this.emptyMessage,
      required this.selectColor,
      this.selectBorderRadius,
      this.selectListTextStyle,
      this.onSearchTap,
      this.onSearchSubmit,
      this.listTextStyle,
      this.searchDecoration,
      required this.listPadding,
      this.clearIconProperty});

  final List<DropDownValueModel> dropDownList;
  final ValueSetter onChanged;
  final double height;
  final double listTileHeight;
  final bool enableSearch;
  final double searchHeight;
  final TextStyle? searchTextStyle;
  final FocusNode searchFocusNode;
  final FocusNode mainFocusNode;
  final TextInputType? searchKeyboardType;
  final Color selectColor;
  final BorderRadius? selectBorderRadius;
  final bool searchAutofocus;
  final bool? searchShowCursor;
  final TextEditingController mainController;
  final bool autoSort;
  final VoidCallback? onSearchTap;
  final VoidCallback? onSearchSubmit;
  final TextStyle? listTextStyle;
  final TextStyle? selectListTextStyle;
  final ListPadding listPadding;
  final InputDecoration? searchDecoration;
  final IconProperty? clearIconProperty;
  final String? emptyMessage;

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  late List<DropDownValueModel> newDropDownList;
  late TextEditingController _searchCnt;
  late InputDecoration _inpDec;

  void onItemChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        newDropDownList = List.from(widget.dropDownList);
      } else {
        newDropDownList = widget.dropDownList
            .where(
                (item) => item.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    _inpDec = widget.searchDecoration ?? const InputDecoration();
    if (widget.searchAutofocus) {
      widget.searchFocusNode.requestFocus();
    }
    newDropDownList = List.from(widget.dropDownList);
    _searchCnt = TextEditingController();
    if (widget.autoSort) {
      onItemChanged(widget.mainController.text);
      widget.mainController.addListener(() {
        if (mounted) {
          onItemChanged(widget.mainController.text);
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.enableSearch)
          SizedBox(
            height: widget.searchHeight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: widget.searchTextStyle,
                focusNode: widget.searchFocusNode,
                showCursor: widget.searchShowCursor,
                keyboardType: widget.searchKeyboardType,
                controller: _searchCnt,
                onTap: () {
                  if (widget.onSearchTap != null) {
                    widget.onSearchTap!();
                  }
                },
                decoration: _inpDec.copyWith(
                  hintText: _inpDec.hintText ?? 'Search Here...',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      widget.mainFocusNode.requestFocus();
                      _searchCnt.clear();
                      onItemChanged('');
                    },
                    child: widget.searchFocusNode.hasFocus
                        ? Icon(
                            widget.clearIconProperty?.icon ?? Icons.close,
                            size: widget.clearIconProperty?.size,
                            color: widget.clearIconProperty?.color,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                onChanged: onItemChanged,
                onSubmitted: (val) {
                  widget.mainFocusNode.requestFocus();
                  if (widget.onSearchSubmit != null) {
                    widget.onSearchSubmit!();
                  }
                },
              ),
            ),
          ),
        if (newDropDownList.isNotEmpty)
          SizedBox(
            height: widget.height,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: newDropDownList.length,
              itemBuilder: (BuildContext context, int index) {
                final bool isSelected = widget.mainController.text.trim() ==
                    newDropDownList[index].name;
                final BorderRadius radius =
                    widget.selectBorderRadius ?? BorderRadius.circular(12);
                return InkWell(
                  onTap: () {
                    widget.onChanged(newDropDownList[index]);
                  },
                  borderRadius: radius,
                  child: Container(
                    // Use minHeight so that long text wraps rather than being clipped.
                    constraints:
                        BoxConstraints(minHeight: widget.listTileHeight),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.selectColor
                          : Colors.transparent,
                      borderRadius: radius,
                    ),
                    padding: EdgeInsets.only(
                      right: widget.listPadding.right,
                      left: widget.listPadding.left,
                      bottom: widget.listPadding.bottom,
                      top: widget.listPadding.top,
                    ),
                    child: Text(
                      newDropDownList[index].name,
                      style: isSelected
                          ? widget.selectListTextStyle
                          : widget.listTextStyle,
                    ),
                  ),
                );
              },
            ),
          ),
        if (newDropDownList.isEmpty)
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Text(
                widget.emptyMessage ?? 'Please provide some dropdown list.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff90909A),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
