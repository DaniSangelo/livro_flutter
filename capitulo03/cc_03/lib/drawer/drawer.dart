import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final String title;

  AppDrawer({Key key, this.title})
      : assert(title != null),
        super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/images/itens_drawer/drawer_header.png'),
                ),
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text("Everton Coimbra de Araújo"),
                accountEmail: Text("evertoncoimbra@gmail.com"),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/avatar_picture_02.jpg'),
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/avatar_picture_03.png'),
                  ),
                ],
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/avatar_picture.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [Colors.green[100], Colors.green[400]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.repeated),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          padding: EdgeInsets.all(0.0),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black,
                          ),
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      ListTileTheme(
                                        contentPadding: EdgeInsets.only(
                                            left: 6.0, top: 0.0, bottom: 0.0),
                                        child: ExpansionTile(
                                          leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/itens_drawer/base_de_palavras.png'),
                                          ),
                                          title: Text(
                                            "Base de Palavras",
                                            style: TextStyle(
                                              color: isExpanded
                                                  ? Colors.indigo
                                                  : Colors.black,
                                              fontWeight: isExpanded
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              fontSize:
                                                  isExpanded ? 24.0 : 16.0,
                                              fontStyle: isExpanded
                                                  ? FontStyle.italic
                                                  : FontStyle.normal,
                                            ),
                                          ),
                                          onExpansionChanged:
                                              (bool expanding) => setState(() =>
                                                  this.isExpanded = expanding),
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 32.0,
                                                  top: 0.0,
                                                  bottom: 8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/icons/add.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                              'Novas palavras'),
                                                          Text(
                                                            "Vamos inserir palavras?",
                                                            style: TextStyle(
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.black38,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 32.0,
                                                  top: 0.0,
                                                  bottom: 8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/icons/list.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                              'Palavras existentes'),
                                                          Text(
                                                            "Vamos ver as que já temos?",
                                                            style: TextStyle(
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.black38,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 6.0, top: 0.0),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/itens_drawer/top10.png'),
                                        ),
                                        trailing: Icon(Icons.arrow_forward),
                                        title: Text('Score'),
                                        subtitle: Text("Relação dos top 10"),
                                        onTap: () {
                                          // Update the state of the app.
                                          // ...
                                        },
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 6.0, top: 0.0),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/itens_drawer/jogar.png'),
                                        ),
                                        trailing: Icon(Icons.arrow_forward),
                                        title: Text('Jogar'),
                                        subtitle: Text("Começar a diversão"),
                                        onTap: () {
                                          // Update the state of the app.
                                          // ...
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // This align moves the children to the bottom
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        // This container holds all the children that will be aligned
                        // on the bottom and should not scroll with the above ListView
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/itens_drawer/utfpr.png',
                                    width: 72.0,
                                  ),
                                  Image.asset(
                                      'assets/images/itens_drawer/casadocodigo.png',
                                      width: 36.0),
                                  Image.asset(
                                      'assets/images/itens_drawer/flutter.png',
                                      width: 36.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
//            Expanded(
//              child: Container(
//                decoration: new BoxDecoration(
//                  gradient: new LinearGradient(
//                      colors: [Colors.green[100], Colors.green[400]],
//                      begin: Alignment.topLeft,
//                      end: Alignment.bottomRight,
//                      stops: [0.0, 1.0],
//                      tileMode: TileMode.repeated),
//                ),
//                child: ListView.separated(
//                  separatorBuilder: (context, index) => Divider(
//                    color: Colors.black,
//                  ),
//                  itemCount: 3,
//                  shrinkWrap: true,
//                  itemBuilder: (context, index) => Container(
//                    child: Container(
//                      child: Column(
//                        children: <Widget>[
//                          ListView(
//                            shrinkWrap: true,
//                            children: <Widget>[],
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
          ],
        ),
        // column holds all the widgets in the drawer
//        child: Container(
//
//          child: Column(
//            children: <Widget>[
//              Expanded(
//                // ListView contains a group of widgets that scroll inside the drawer
//                child: ListView(
//                  children: <Widget>[
//                    DrawerHeader(
//                      padding: EdgeInsets.zero,
//                      margin: EdgeInsets.zero,
//                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          fit: BoxFit.fill,
//                          image: AssetImage(
//                              'assets/images/itens_drawer/drawer_header.png'),
//                        ),
//                      ),
//                      child: UserAccountsDrawerHeader(
//                        decoration: BoxDecoration(color: Colors.transparent),
//                        accountName: Text("Everton Coimbra de Araújo"),
//                        accountEmail: Text("evertoncoimbra@gmail.com"),
//                        otherAccountsPictures: <Widget>[
//                          CircleAvatar(
//                            backgroundImage: AssetImage(
//                                'assets/images/avatar_picture_02.jpg'),
//                          ),
//                          CircleAvatar(
//                            backgroundImage: AssetImage(
//                                'assets/images/avatar_picture_03.png'),
//                          ),
//                        ],
//                        currentAccountPicture: CircleAvatar(
//                          backgroundImage:
//                              AssetImage('assets/images/avatar_picture.jpg'),
//                        ),
//                      ),
//                    ),
//                    ListTileTheme(
//                      contentPadding:
//                          EdgeInsets.only(left: 6.0, top: 2.0, bottom: 0.0),
//                      child: ExpansionTile(
//                        leading: CircleAvatar(
//                          backgroundImage: AssetImage(
//                              'assets/images/itens_drawer/base_de_palavras.png'),
//                        ),
//                        title: Text(
//                          "Base de Palavras",
//                          style: TextStyle(
//                            color: isExpanded ? Colors.indigo : Colors.black,
//                            fontWeight: isExpanded
//                                ? FontWeight.bold
//                                : FontWeight.normal,
//                            fontSize: isExpanded ? 24.0 : 16.0,
//                            fontStyle: isExpanded
//                                ? FontStyle.italic
//                                : FontStyle.normal,
//                          ),
//                        ),
//                        onExpansionChanged: (bool expanding) =>
//                            setState(() => this.isExpanded = expanding),
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(
//                                left: 32.0, top: 0.0, bottom: 8.0),
//                            child: Row(
//                              children: <Widget>[
//                                Container(
//                                  width: 30.0,
//                                  height: 30.0,
//                                  decoration: BoxDecoration(
//                                    shape: BoxShape.circle,
//                                    image: DecorationImage(
//                                      image: AssetImage(
//                                          'assets/images/icons/add.png'),
//                                      fit: BoxFit.cover,
//                                    ),
//                                  ),
//                                ),
//                                Expanded(
//                                  child: Padding(
//                                    padding: const EdgeInsets.only(left: 8.0),
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text('Novas palavras'),
//                                        Text(
//                                          "Vamos inserir palavras?",
//                                          style: TextStyle(
//                                            fontSize: 10.0,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                                Icon(
//                                  Icons.arrow_forward,
//                                  color: Colors.black38,
//                                )
//                              ],
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(
//                                left: 32.0, top: 0.0, bottom: 8.0),
//                            child: Row(
//                              children: <Widget>[
//                                Container(
//                                  width: 30.0,
//                                  height: 30.0,
//                                  decoration: BoxDecoration(
//                                    shape: BoxShape.circle,
//                                    image: DecorationImage(
//                                      image: AssetImage(
//                                          'assets/images/icons/list.png'),
//                                      fit: BoxFit.cover,
//                                    ),
//                                  ),
//                                ),
//                                Expanded(
//                                  child: Padding(
//                                    padding: const EdgeInsets.only(left: 8.0),
//                                    child: Column(
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text('Palavras existentes'),
//                                        Text(
//                                          "Vamos ver as que já temos?",
//                                          style: TextStyle(
//                                            fontSize: 10.0,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                                Icon(
//                                  Icons.arrow_forward,
//                                  color: Colors.black38,
//                                )
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Divider(),
//                    ListTile(
//                      contentPadding: EdgeInsets.only(left: 6.0, top: 0.0),
//                      leading: CircleAvatar(
//                        backgroundImage:
//                            AssetImage('assets/images/itens_drawer/top10.png'),
//                      ),
//                      trailing: Icon(Icons.arrow_forward),
//                      title: Text('Score'),
//                      subtitle: Text("Relação dos top 10"),
//                      onTap: () {
//                        // Update the state of the app.
//                        // ...
//                      },
//                    ),
//                    Divider(),
//                    ListTile(
//                      contentPadding: EdgeInsets.only(left: 6.0, top: 0.0),
//                      leading: CircleAvatar(
//                        backgroundImage:
//                            AssetImage('assets/images/itens_drawer/jogar.png'),
//                      ),
//                      trailing: Icon(Icons.arrow_forward),
//                      title: Text('Jogar'),
//                      subtitle: Text("Começar a diversão"),
//                      onTap: () {
//                        // Update the state of the app.
//                        // ...
//                      },
//                    ),
//                  ],
//                ),
//              ),
//              // This container holds the align
//              Container(
//                // This align moves the children to the bottom
//                child: Align(
//                  alignment: FractionalOffset.bottomCenter,
//                  // This container holds all the children that will be aligned
//                  // on the bottom and should not scroll with the above ListView
//                  child: Container(
//                    child: Column(
//                      children: <Widget>[
//                        Divider(),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceAround,
//                          children: <Widget>[
//                            Image.asset(
//                              'assets/images/itens_drawer/utfpr.png',
//                              width: 72.0,
//                            ),
//                            Image.asset(
//                                'assets/images/itens_drawer/casadocodigo.png',
//                                width: 36.0),
//                            Image.asset(
//                                'assets/images/itens_drawer/flutter.png',
//                                width: 36.0),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
      ),
//      drawer: Drawer(
//        child: Container(
//          decoration: new BoxDecoration(
//            gradient: new LinearGradient(
//                colors: [Colors.green[100], Colors.green[400]],
//                begin: Alignment.topLeft,
//                end: Alignment.bottomRight,
//                stops: [0.0, 1.0],
//                tileMode: TileMode.repeated),
//          ),
//          child: ListView(
//            padding: EdgeInsets.zero,
//            children: <Widget>[
//              DrawerHeader(
//                padding: EdgeInsets.zero,
//                margin: EdgeInsets.zero,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: AssetImage(
//                        'assets/images/itens_drawer/drawer_header.png'),
//                  ),
//                ),
//                child: UserAccountsDrawerHeader(
//                  decoration: BoxDecoration(color: Colors.transparent),
//                  accountName: Text("Ashish Rawat"),
//                  accountEmail: Text("ashishrawat2911@gmail.com"),
//                  otherAccountsPictures: <Widget>[
//                    Text(
//                      "B",
//                      style: TextStyle(fontSize: 40.0),
//                    ),
//                    Text(
//                      "c",
//                      style: TextStyle(fontSize: 40.0),
//                    )
//                  ],
//                  currentAccountPicture: CircleAvatar(
//                    backgroundImage:
//                        AssetImage('assets/images/avatar_picture.jpg'),
//                  ),
//                ),
//              ),
////                Column(
////                  mainAxisSize: MainAxisSize.max,
////                  children: <Widget>[
////                    ListTile(
////                      contentPadding: EdgeInsets.only(left: 6.0, top: 2.0),
////                      leading: CircleAvatar(
////                        backgroundImage: AssetImage(
////                            'assets/images/itens_drawer/base_de_palavras.png'),
////                      ),
////                      trailing: Icon(Icons.arrow_forward),
////                      title: Text('Base de palavras'),
////                      subtitle: Text('Registro de palavras para o jogo'),
////                      onTap: () {
////                        // Update the state of the app.
////                        // ...
////                      },
////                    ),
////                    Container(
////                      child: Align(
////                        alignment: FractionalOffset.bottomCenter,
////                        child: Container(
////                          child: Column(
////                            children: <Widget>[
////                              Text("Teste"),
////                            ],
////                          ),
////                        ),
////                      ),
////                    ),
////                  ],
////                ),
////              ListTile(
////                title: Text('Item 2'),
////                onTap: () {
////                  // Update the state of the app.
////                  // ...
////                },
////              ),
//            ],
//          ),
//        ),
//      ),
    );
  }
}
