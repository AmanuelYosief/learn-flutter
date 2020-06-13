import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    // Required specifies that a property must be included (it can be null)
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text !=
            null), // Stops execution if a boolean condition is false -> more clear debugging
        super(
            // Call super class constructor, passing parameter
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  //Image is a widget, so we can pass it to our custombutton's child
                  assetName,
                ),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0,
                  child: Image.asset(
                    //Image is a widget, so we can pass it to our custombutton's child
                    assetName,
                  ),
                ),
              ],
            ),
            color: color,
            onPressed: onPressed);
}
