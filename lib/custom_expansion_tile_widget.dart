import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  final String title;
  final Widget? subtitle;
  final List<Widget> children;
  final Function(bool)? onExpansionChanged;
  bool? hasStandardPadding = false;

  CustomExpansionTileWidget({
    Key? key,
    required this.title,
    this.subtitle,
    required this.children,
    this.onExpansionChanged,
    this.hasStandardPadding,
  });

  @override
  _CustomExpansionTileWidgetState createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          dividerColor: Colors.transparent,
          highlightColor: Colors.transparent,
          visualDensity: VisualDensity.compact,
          colorScheme: const ColorScheme.light(primary: Colors.grey)),
      child: ListTileTheme(
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: const EdgeInsets.all(0),
          iconColor: Colors.black,
          trailing: Padding(
            padding: widget.hasStandardPadding ?? false
                ? EdgeInsets.only(
                    right: 16,
                    top: widget.subtitle == null ? 8 : 0,
                    bottom: widget.subtitle != null ? 16 : 0,
                  )
                : EdgeInsets.zero,
            child: RotatedBox(
              quarterTurns: isOpen ? 2 : 0,
              child: const Icon(Icons.keyboard_arrow_down, size: 20),
            ),
          ),
          onExpansionChanged: (value) {
            setState(() {
              isOpen = value;
              if (widget.onExpansionChanged != null) {
                widget.onExpansionChanged!(value);
              }
            });
          },
          subtitle: widget.subtitle != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 16),
                  child: widget.subtitle,
                )
              : null,
          title: Padding(
            padding: widget.hasStandardPadding ?? false
                ? EdgeInsets.only(
                    left: 16,
                    top: 8,
                    bottom: isOpen ? 0 : 8,
                  )
                : EdgeInsets.zero,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: [
            Padding(
              padding: widget.hasStandardPadding ?? false
                  ? const EdgeInsets.fromLTRB(16, 8, 16, 0)
                  : EdgeInsets.zero,
              child: Column(children: widget.children),
            ),
          ],
        ),
      ),
    );
  }
}
