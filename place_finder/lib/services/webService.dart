import 'dart:convert';
import 'package:place_finder/models/place.dart';
import 'package:place_finder/utils/urlHelper.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Place>> fetchPlacesByKeywordAndPosition(
      String keyword, double lat, double lng) async {
    final url = UrlHelper().urlForPlaceKeywordAndLocation(keyword, lat, lng);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Successful API call
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse["results"];

      return results.map((place) => Place.fromJSON(place)).toList();
    } else {
      // API call failed
      throw Exception("Failed to fetch data");
    }
  }
}
