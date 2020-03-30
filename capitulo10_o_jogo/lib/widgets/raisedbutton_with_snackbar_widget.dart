import 'package:flutter/material.dart';

class RaisedButtonWithSnackbarWidget extends StatelessWidget {
  bool onPressedVisible;
  String buttonText;
  String successTextToSnackBar;
  String failTextToSnackBar;
  Function onButtonPressed;
  Function onStackBarClosed;

  RaisedButtonWithSnackbarWidget(
      {@required this.onPressedVisible,
      @required this.buttonText,
      @required this.successTextToSnackBar,
      @required this.onButtonPressed,
      @required this.onStackBarClosed,
      @required this.failTextToSnackBar});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.buttonText),
      onPressed: this.onPressedVisible
          ? () async {
              await _onPressedRaisedButton(context);
            }
          : null,
    );
  }

  _onPressedRaisedButton(BuildContext buildContext) async {
    String textToSnackBar = this.successTextToSnackBar;
    bool success = true;
    FocusScope.of(buildContext).unfocus();
    try {
      await this.onButtonPressed();
    } catch (e) {
      textToSnackBar = this.failTextToSnackBar + ': ' + e.toString();
      success = false;
    }

    Scaffold.of(buildContext)
        .showSnackBar(
          SnackBar(
            backgroundColor: (success) ? Colors.indigo : Colors.red,
            content: Text(
              textToSnackBar,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (success) ? 14 : 16,
              ),
            ),
            duration: Duration(seconds: (success) ? 3 : 5),
          ),
        )
        .closed
        .then((_) => (success) ? this.onStackBarClosed() : () {});
  }
}
