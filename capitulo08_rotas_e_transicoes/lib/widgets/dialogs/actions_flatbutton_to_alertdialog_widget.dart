import 'package:flutter/material.dart';

class ActionsFlatButtonToAlertDialogWidget extends StatelessWidget {
  final String messageButton;
  final TextStyle textStyleMessageButton;
  final Icon iconButton;

  const ActionsFlatButtonToAlertDialogWidget({
    this.messageButton,
    this.textStyleMessageButton = const TextStyle(color: Colors.black),
    this.iconButton,
  }) : assert(messageButton != null || iconButton != null);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context)
              .pop(this.messageButton ?? this.iconButton.icon.toString());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.messageButton,
              style: this.textStyleMessageButton,
            ),
            (this.iconButton != null)
                ? SizedBox(width: 5)
                : SizedBox(
                    width: 0,
                  ),
            (this.iconButton != null)
                ? this.iconButton
                : SizedBox(
                    width: 0,
                  ),
          ],
        ));
  }
}
