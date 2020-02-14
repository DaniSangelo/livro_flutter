import 'package:capitulo09_persistencia_e_anim/routes/palavras/bloc/listview/palavras_listview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PalavrasListViewRoute extends StatefulWidget {
  @override
  _PalavrasListViewRouteState createState() => _PalavrasListViewRouteState();
}

class _PalavrasListViewRouteState extends State<PalavrasListViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Palavras registradas'),
        elevation: 10,
      ),
      body: BlocBuilder<PalavrasListViewBloc, PalavrasListViewBlocState>(
          builder: (context, state) {
        if (state is PalavrasListViewBlocError) {
          return Center(
            child: Text('Falha ao recuperar palavras'),
          );
        }

        if (state is PalavrasListViewLoaded) {
          if (state.palavras.isEmpty) {
            return Center(
              child: Text('Nenhuma palavra registrada ainda.'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: state.palavras.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 5, bottom: 5, top: 3),
                  title: Text(
                    state.palavras[index].palavra,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
