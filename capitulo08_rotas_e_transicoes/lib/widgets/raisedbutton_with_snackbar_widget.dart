import 'package:flutter/material.dart';

class RaisedButtonWithSnackbarWidget extends StatelessWidget {
  bool onPressedVisible;
  String buttonText;

  RaisedButtonWithSnackbarWidget(
      {@required this.onPressedVisible, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.buttonText),
      onPressed: this.onPressedVisible
          ? () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Button moved to separate widget'),
                duration: Duration(seconds: 3),
              ));
            }
          : null,
    );
  }
}
