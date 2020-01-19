import 'package:flutter/cupertino.dart';

class InformationCupertinoAlertDialogDialog extends StatelessWidget {
  final Icon iconTitle;
  final String title;
  final String message;
  final List<Widget> buttons;

  const InformationCupertinoAlertDialogDialog({
    this.iconTitle,
    @required this.title,
    @required this.message,
    @required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('OK'),
//      Row(
////        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          (this.iconTitle != null)
//              ? this.iconTitle
//              : SizedBox(
//                  width: 0,
//                ),
//          (this.iconTitle != null)
//              ? SizedBox(width: 5)
//              : SizedBox(
//                  width: 0,
//                ),
//          Text(this.title),
//        ],
//      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            this.message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: <Widget>[CupertinoDialogAction(isDefaultAction: true, i child: Text('OK'),),] //_cupertinoActions()
    );
  }

  List<CupertinoDialogAction> _cupertinoActions() {
    List<CupertinoDialogAction> buttons = List<CupertinoDialogAction>();
    this.buttons.forEach((b) => buttons.add(CupertinoDialogAction(isDefaultAction: true, child: b,),),);
    return buttons;
  }
}
