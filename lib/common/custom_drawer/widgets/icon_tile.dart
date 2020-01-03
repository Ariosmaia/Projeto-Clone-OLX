import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highLighted;

  const IconTile(
      {Key key, this.label, this.iconData, this.onTap, this.highLighted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            color: highLighted ? Colors.blue : Colors.black),
      ),
      leading: Icon(
        iconData,
        color: highLighted ? Colors.blue : Colors.black,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}
