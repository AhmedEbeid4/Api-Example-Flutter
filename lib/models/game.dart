class Game {
  int id;
  String title, image, description, gameUrl, platform, publisher;

  Game(
      {required this.id,
      required this.title,
      required this.image,
      required this.description,
      required this.gameUrl,
      required this.platform,
      required this.publisher
      });

  factory Game.fromJson(Map<String, dynamic> data) {
    return Game(
        id: data["id"],
        title: data["title"],
        image: data["thumbnail"],
        description: data['short_description'],
        gameUrl:  data['game_url'],
        platform: data['platform'],
        publisher: data['publisher']
    );
  }
}
