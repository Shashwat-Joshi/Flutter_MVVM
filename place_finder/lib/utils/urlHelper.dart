class UrlHelper {
  String _apiKey = "AIzaSyD0k8lFzrVmt_HC6Xb4HpKCMiSdHinaikg";

  String urlForPlaceKeywordAndLocation(String keyword, double lat, double lon) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lon&radius=1500&type=restaurant&keyword=$keyword&key=${this._apiKey}";
  }

  String photoUrlFromReference(String reference) {
    return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$reference&key=${this._apiKey}";
  }
}
