import 'package:flutter/material.dart';

class LetraTecladoJogoWidget extends StatefulWidget {
  final String letra;
  final bool foiUtilizada;

  LetraTecladoJogoWidget({
    this.letra,
    this.foiUtilizada = false,
  });

  @override
  _LetraTecladoJogoWidgetState createState() => _LetraTecladoJogoWidgetState();

  LetraTecladoJogoWidget copyWith(LetraTecladoJogoWidget newValues) {
    return LetraTecladoJogoWidget(
      letra: newValues.letra ?? letra,
      foiUtilizada: newValues.foiUtilizada ?? foiUtilizada,
    );
  }
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
