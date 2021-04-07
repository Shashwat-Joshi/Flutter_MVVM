class Story {
  final String? title;
  final String? url;
  final List<int>? commentIds;

  Story({
    required this.title,
    required this.url,
    required this.commentIds,
  });

  factory Story.fromJSON(Map<String, dynamic> json) {
    return Story(
      title: json["title"],
      url: json["url"],
      commentIds: json["kids"] == null ? [] : json["kids"].cast<int>(),
    );
  }
}
