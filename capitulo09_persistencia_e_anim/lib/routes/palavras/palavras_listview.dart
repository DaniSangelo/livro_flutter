import 'package:flutter/material.dart';

class PalavrasListViewRoute extends StatefulWidget {
  @override
  _PalavrasListViewRouteState createState() => _PalavrasListViewRouteState();
}

class _PalavrasListViewRouteState extends State<PalavrasListViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Campanhas registradas'),
        backgroundColor: Colors.red.withOpacity(0.9),
        elevation: 10,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: BlocBuilder<CampanhaListViewBloc, CampanhaBlocState>(
        builder: (context, state) {
          if (state is CampanhaBlocError) {
            return Center(
              child: Text('Falha ao recuperar campanhas'),
            );
          }
          if (state is CampanhaBlocLoaded) {
            if (state.campanhas.isEmpty) {
              return Center(
                child: Text('Nenhuma campanha registrada ainda.'),
              );
            }

            if (this._scrollController.hasClients) {
              for (int i = 0; i < state.campanhas.length; i++) {
                if (state.campanhas[i].campanhaID == this._selectedCampanhaID) {
                  _scrollController.animateTo(i * 60.0,
                      duration: new Duration(seconds: 2), curve: Curves.ease);
                  this._selectedCampanhaID = null;
                }
              }
            }

            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (BuildContext context, int index) {
                return index >= state.campanhas.length
                    ? BottomLoader()
                    : Container(
                        color: (this._selectedTile != null &&
                                this._selectedTile == index)
                            ? Colors.red[100]
                            : Colors.transparent,
                        child: CampanhaTileWidget(
                          campanhaModel: state.campanhas[index],
                          onSelectedCampanha: () async {
                            this._selectedTile = index;
                            await this
                                .onSelectedCampanha(state.campanhas[index]);
                          },
                          removeCampanha: () async {
                            String oQueFazer = await this._canRemoveCampanha(
                                state.campanhas[index].nome, context);
                            if (oQueFazer == 'Sim') {
                              await this._doRemoveCampanha(
                                  state.campanhas[index].campanhaID, context);
                            }
                          },
                        ),
                      );
              },
              itemCount: state.hasReachedMax
                  ? state.campanhas.length
                  : state.campanhas.length + 1,
              controller: _scrollController,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
