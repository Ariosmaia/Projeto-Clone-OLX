import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocs/home_bloc.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';
import 'package:xlo/screens/home/widgets/search_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBLoc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
    if (homeBloc != _homeBLoc) _homeBLoc = homeBloc;
  }

  @override
  Widget build(BuildContext context) {
    _openSeach(String currentSearch) async {
      final String search = await showDialog(
        context: context,
        builder: (context) => SearchDialog(currentSearch: currentSearch),
      );
      if (search != null) _homeBLoc.setSearch(search);
    }

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
            stream: _homeBLoc.outSearch,
            initialData: '',
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty)
                return Container();
              else
                return GestureDetector(
                  onTap: () => _openSeach(snapshot.data),
                  // Macete para ficar clicavel o espaço
                  child: LayoutBuilder(
                    //Constraints define o tamanho maximo, minino etc..
                    builder: (context, constraints) {
                      return Container(
                        child: Text(snapshot.data),
                        width: constraints.biggest.width,
                      );
                    },
                  ),
                );
            }),
        actions: <Widget>[
          StreamBuilder<String>(
              stream: _homeBLoc.outSearch,
              initialData: '',
              builder: (context, snapshot) {
                if (snapshot.data.isEmpty)
                  return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _openSeach("");
                    },
                  );
                else
                  return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      _homeBLoc.setSearch('');
                    },
                  );
              })
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
