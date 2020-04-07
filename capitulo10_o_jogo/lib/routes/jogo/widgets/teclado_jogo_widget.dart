import 'package:flutter/material.dart';

class TecladoJogoWidget extends StatefulWidget {
  final List<Widget> textsParaLetras;

  const TecladoJogoWidget({this.textsParaLetras});

  @override
  _TecladoJogoWidgetState createState() => _TecladoJogoWidgetState();
}

class _TecladoJogoWidgetState extends State<TecladoJogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 5,
      children: widget.textsParaLetras,
    );
  }
}
