import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  const CustomRaisedButton({
    Key key,
    this.child,
    this.color,
    this.borderRadius: 2.0, // setting a default paramaters
    this.height: 50,
    this.onPressed,
  })  : assert(borderRadius !=
            null), // Earlier debugging instead of Flutter's SDK, only works in debug mode
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        onPressed: onPressed,
      ),
    );
  }
}
