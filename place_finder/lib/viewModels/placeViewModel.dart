import 'package:place_finder/models/place.dart';

class PlaceViewModel {
  final Place _place;

  PlaceViewModel(Place place) : this._place = place;

  String? get name {
    return _place.name;
  }

  double? get lat {
    return _place.lat;
  }

  double? get lng {
    return _place.lng;
  }

  String? get placeId {
    return _place.placeId;
  }

  String? get photoURL {
    return _place.photoUrl;
  }
}
