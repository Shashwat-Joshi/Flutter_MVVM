class Incident {
  final String title;
  final String description;

  Incident({
    required this.title,
    required this.description,
  });

  factory Incident.fromJSON(Map<String, dynamic> json) {
    return Incident(
      title: json["title"],
      description: json["description"],
    );
  }
}
