import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder/services/webService.dart';
import 'package:place_finder/viewModels/placeViewModel.dart';

class PlaceListViewModel extends ChangeNotifier {
  List<PlaceViewModel> places = [];
  MapType mapType = MapType.normal;

  void toggleMapType() {
    this.mapType =
        this.mapType == MapType.normal ? MapType.satellite : MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double lat, double lng) async {
    final results =
        await WebService().fetchPlacesByKeywordAndPosition(keyword, lat, lng);
    print("\n\n${results.length}\n\n");
    this.places = results.map((place) => PlaceViewModel(place)).toList();

    notifyListeners();
  }
}
