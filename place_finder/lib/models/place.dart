class Place {
  final String? name;
  final double? lat, lng;
  final String? placeId;
  final String? photoUrl;

  Place({
    required this.name,
    required this.lat,
    required this.lng,
    required this.placeId,
    required this.photoUrl,
  });

  factory Place.fromJSON(Map<String, dynamic> json) {
    final location = json["geometry"]["location"];
    Iterable? photos = json["photos"];
    return Place(
      name: json["name"],
      lat: location["lat"],
      lng: location["lng"],
      placeId: json["place_id"],
      photoUrl: photos?.first["photo_reference"] ?? "",
    );
  }
}
