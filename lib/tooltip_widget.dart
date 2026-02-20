import 'package:flutter/material.dart';

class ToolTipWidget extends StatefulWidget {
  const ToolTipWidget({super.key, required this.msg});
  final String msg;

  @override
  State<ToolTipWidget> createState() => _ToolTipWidgetState();
}

class _ToolTipWidgetState extends State<ToolTipWidget> {
  late OverlayEntry _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showOverlay(context);
      },
      child: const Icon(
        Icons.info_outlined,
        size: 20,
        color: Colors.blueAccent,
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    final OverlayState overlayState = Overlay.of(context);
    const double iconSize = 70;
    _overlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: SizedBox(
                        height: iconSize,
                        width: iconSize,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder:
                              (BuildContext context, double value, Widget? child) {
                            return Icon(Icons.info_outlined,
                                size: iconSize * value, color: Colors.blue);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.msg,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: Colors.lightBlueAccent,
                      onPressed: _closeOverlay,
                      child: const Text(
                        'Ok',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
    overlayState.insert(_overlayEntry);
  }

  void _closeOverlay() {
    _overlayEntry.remove();
  }
}
