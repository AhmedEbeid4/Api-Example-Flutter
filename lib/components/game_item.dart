import 'package:flutter/material.dart';

import '../models/game.dart';
class GameItem extends StatelessWidget {
  late Game game;
  late VoidCallback onClick;
  GameItem({Key? key,required this.game,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(game.image,fit: BoxFit.cover,)
              ),
              const SizedBox(height: 10,),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text("id :${game.id}")
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text("title : ${game.title}"),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
