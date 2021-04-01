class UrlHelper {
  String _apiKey = "AIzaSyDtRFkbJ23PuD6y45h49k2AIR-MAywCx40";

  String urlForPlaceKeywordAndLocation(String keyword, double lat, double lon) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lon&radius=1500&type=restaurant&keyword=$keyword&key=${this._apiKey}";
  }

  String photoUrlFromReference(String reference) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$reference&key=${this._apiKey}";
  }
}
