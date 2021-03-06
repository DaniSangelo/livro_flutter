import 'package:capitulo08_rotas_e_transicoes/routes/palavras/bloc/palavras_crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apphelpers/app_router.dart';
import 'drawer/blocs/drawer_open_state_bloc.dart';
import 'functions/device_functions.dart' as DeviceFunctions;
import 'routes/splash_screen_route.dart';

void main() => runApp(
      MultiBlocProvider(providers: [
        BlocProvider<DrawerOpenStateBloc>(
          create: (BuildContext context) => DrawerOpenStateBloc(),
        ),
        BlocProvider<PalavrasCrudFormBloc>(
          create: (BuildContext context) => PalavrasCrudFormBloc(),
        ),
      ], child: ForcaApp()),
    );

class ForcaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Forca da UTFPR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.green,
      ),
      home: ForcaHomePage(),
    );
  }
}

class ForcaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceFunctions.Dimensoes.deviceHeight = MediaQuery.of(context).size.height;
    DeviceFunctions.Dimensoes.deviceWidth = MediaQuery.of(context).size.width;
    DeviceFunctions.Dimensoes.shortestSide =
        MediaQuery.of(context).size.shortestSide;
    DeviceFunctions.Dimensoes.safeAreaTop = MediaQuery.of(context).padding.top;
    DeviceFunctions.Dimensoes.safeAreaBottom =
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SplashScreenRoute(),
    );
  }
}
