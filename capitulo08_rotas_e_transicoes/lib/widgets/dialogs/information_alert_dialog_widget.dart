import 'dart:io';

import 'package:capitulo08_rotas_e_transicoes/widgets/dialogs/information_material_alert_dialog_widget.dart';
import 'package:flutter/material.dart';

import 'information_cupertino_alert_dialog_widget.dart';

class InformationAlertDialogWidget extends StatelessWidget {
  final Icon iconTitle;
  final String title;
  final String message;
  final List<Widget> actions;

  const InformationAlertDialogWidget({
    this.iconTitle,
    @required this.title,
    @required this.message,
    @required this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return (Platform.isAndroid)
        ? InformationMaterialAlertDialogWidget(
            iconTitle: iconTitle,
            title: title,
            message: message,
            buttons: actions,
          )
        : InformationCupertinoAlertDialogDialog(
            title: title,
            message: message,
            actions: actions,
          );
  }
}
