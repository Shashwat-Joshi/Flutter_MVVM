class Incident {
  final String? title;
  final String? description;
  final String? imageURL;

  Incident({
    required this.title,
    required this.description,
    required this.imageURL,
  });

  factory Incident.fromJSON(Map<String, dynamic> json) {
    return Incident(
      title: json["title"],
      description: json["description"],
      imageURL: json["imageURL"],
    );
  }
}
