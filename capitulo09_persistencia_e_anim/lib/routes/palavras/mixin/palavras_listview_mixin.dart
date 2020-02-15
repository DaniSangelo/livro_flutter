import 'package:capitulo09_persistencia_e_anim/routes/palavras/bloc/listview/palavras_listview_bloc.dart';
import 'package:flutter/material.dart';

mixin PalavrasListViewMixim {
  centerText({String text}) {
    return Center(child: Text(text));
  }

  onScroll(
      {PalavrasListViewBloc palavrasListViewBloc,
      ScrollController scrollController,
      double scrollThreshold}) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    print('onScroll');
    print('maxScroll -> $maxScroll');
    print('currentScroll -> $currentScroll');
    print('scrollThreshold -> $scrollThreshold');
    if (maxScroll - currentScroll <= scrollThreshold) {
      palavrasListViewBloc.add(PalavrasListViewBlocEventFetch());
    }
  }
}
