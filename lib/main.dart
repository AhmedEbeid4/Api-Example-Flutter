import 'package:api_example/services/api_services.dart';
import 'package:api_example/components/game_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/game.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Game>? games=[];

  void _getGames() async {
    games = (await ApiService().fetchGames())!;
    setState(() {

    });
  }


  @override
  void initState() {
    _getGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('API Example'),
        ),
        body: games == null || games!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: games?.length,
                itemBuilder: (context, index) {
                  return GameItem(game: games![index],onClick: ()async{
                    await launchUrl(Uri.parse(games![index].gameUrl));
                  },);
                }),
      ),
    );
  }
}
