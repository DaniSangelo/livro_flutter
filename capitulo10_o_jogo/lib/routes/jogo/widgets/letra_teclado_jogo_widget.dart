import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LetraTecladoJogoWidget extends StatefulWidget {
  final String letra;
  final bool foiUtilizada;

  LetraTecladoJogoWidget({
    this.letra,
    this.foiUtilizada = false,
  });

  @override
  _LetraTecladoJogoWidgetState createState() => _LetraTecladoJogoWidgetState();
}

class _LetraTecladoJogoWidgetState extends State<LetraTecladoJogoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.letra,
      style: TextStyle(
        color: widget.foiUtilizada ? Colors.red : Colors.black,
        fontSize: 40,
      ),
    );
  }
}
