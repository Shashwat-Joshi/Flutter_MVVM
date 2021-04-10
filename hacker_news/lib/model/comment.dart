class Comment {
  final String? title;
  final String? id;

  Comment({
    required this.title,
    required this.id,
  });

  factory Comment.fromJSON(Map<String, dynamic> json) {
    return Comment(
      title: json["text"],
      id: json["id"].toString(),
    );
  }
}
