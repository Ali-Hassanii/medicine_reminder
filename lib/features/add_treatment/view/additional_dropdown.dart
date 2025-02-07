import 'package:flutter/material.dart';

class AdditionalDropdown extends StatelessWidget {
  const AdditionalDropdown({
    super.key,
    required List<Widget> children,
    double? spacing,
  })  : _children = children,
        _spacing = spacing;

  final List<Widget> _children;
  final double? _spacing;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border.all(
        width: 0,
        color: Colors.transparent,
      ),
      title: Row(
        children: [
          Text("Additional Info"),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
          Expanded(
            child: Divider(
              height: 4,
            ),
          ),
        ],
      ),
      children: _children
          .map(
            (widget) => Padding(
              padding: EdgeInsets.only(bottom: _spacing ?? 0),
              child: widget,
            ),
          )
          .toList(),
    );
  }
}
