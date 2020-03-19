class StoryModel {
  final int id;
  final String name;
  final String imageUrl;

  final bool markedReadLater;

  StoryModel({this.id, this.name, this.imageUrl, this.markedReadLater = false});
}
