import 'dart:convert';

import 'package:api_example/models/constants.dart';
import 'package:api_example/models/game.dart';

import 'package:http/http.dart' as http;
class ApiService{
  Future<List<Game>?> fetchGames() async {
    try{
      http.Response response = await http.get(ApiConstants.baseUrl);
      var body = jsonDecode(response.body).cast <Map <String ,dynamic>>();
      List<Game> games = [];
      for(var item in body){
        games.add(Game.fromJson(item));
      }
      return games;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}