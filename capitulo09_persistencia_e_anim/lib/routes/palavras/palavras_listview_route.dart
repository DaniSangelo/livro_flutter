import 'package:capitulo09_persistencia_e_anim/routes/palavras/bloc/listview/palavras_listview_bloc.dart';
import 'package:capitulo09_persistencia_e_anim/routes/palavras/mixin/palavras_listview_mixin.dart';
import 'package:capitulo09_persistencia_e_anim/routes/palavras/widgets/palavras_listtile_widget.dart';
import 'package:dialog_information_to_specific_platform/dialog_information_to_specific_platform.dart';
import 'package:dialog_information_to_specific_platform/flat_buttons/actions_flatbutton_to_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/bottom_loader_widget.dart';

class PalavrasListViewRoute extends StatefulWidget {
  @override
  _PalavrasListViewRouteState createState() => _PalavrasListViewRouteState();
}

class _PalavrasListViewRouteState extends State<PalavrasListViewRoute>
    with PalavrasListViewMixim {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PalavrasListViewBloc _palavrasListViewBloc;

  @override
  void initState() {
    super.initState();
    _palavrasListViewBloc = BlocProvider.of<PalavrasListViewBloc>(context);

    _scrollController.addListener(() => onScroll(
        palavrasListViewBloc: _palavrasListViewBloc,
        scrollController: _scrollController,
        scrollThreshold: _scrollThreshold));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _palavrasListViewBloc.close();
    super.dispose();
  }

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
          return centerText(
              text: 'Falha ao recuperar palavras: ${state.errorMessage}');
        }

        if (state is PalavrasListViewLoaded) {
          if (state.palavras.isEmpty) {
            return centerText(text: 'Nenhuma palavra registrada ainda.');
          }

//          if (this._scrollController.hasClients) {
//            for (int i = 0; i < state.palavras.length; i++) {
//              if (state.palavras[i].campanhaID == this._selectedCampanhaID) {
//                _scrollController.animateTo(i * 60.0,
//                    duration: new Duration(seconds: 2), curve: Curves.ease);
//                this._selectedCampanhaID = null;
//              }
//            }
//          }

          return ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: state.hasReachedMax
                ? state.palavras.length
                : state.palavras.length + 1,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return (index >= state.palavras.length)
                  ? BottomLoaderWidget()
                  : Dismissible(
                      key: Key(state.palavras[index].palavraID),
                      confirmDismiss: (direction) async {
                        var oQueFazer = await confirmDismiss(
                            context: context,
                            palavra: state.palavras[index].palavra);
                        return oQueFazer == 'Sim';
                      },
                      onDismissed: (direction) async {
                        await dismissedComplete(
                            context: context,
                            palavraID: state.palavras[index].palavraID,
                            palavra: state.palavras[index].palavra);
                        return;
                      },
                      background: Container(
                        color: Colors.red,
                      ),
                      child: GestureDetector(
                        onLongPress: () {
                          print('onLongPress');
                        },
                        child: PalavrasListTileWidget(
                          title: state.palavras[index].palavra,
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
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
