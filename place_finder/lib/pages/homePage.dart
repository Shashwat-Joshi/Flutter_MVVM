import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder/viewModels/placeListViewModel.dart';
import 'package:place_finder/viewModels/placeViewModel.dart';
import 'package:place_finder/widgets/placeList.dart';
import 'package:provider/provider.dart';
import 'package:map_launcher/map_launcher.dart' as mapLauncher;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  late Position _position;
  @override
  void initState() {
    super.initState();
  }

  _checkPermissionForLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
  }

  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places) {
    return places.map((place) {
      return Marker(
        markerId: MarkerId(place.placeId ?? ""),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: place.name ?? ""),
        position: LatLng(place.lat ?? 0, place.lng ?? 0),
      );
    }).toSet();
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    _checkPermissionForLocation();
    _position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(_position);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 18,
          target: LatLng(
            _position.latitude,
            _position.longitude,
          ),
        ),
      ),
    );
  }

  Future<void> _openMapsFor(PlaceViewModel viewModel) async {
    bool? isGoogle = await mapLauncher.MapLauncher.isMapAvailable(
        mapLauncher.MapType.google);

    bool? isApple =
        await mapLauncher.MapLauncher.isMapAvailable(mapLauncher.MapType.apple);

    if (isGoogle ?? false) {
      await mapLauncher.MapLauncher.showMarker(
        mapType: mapLauncher.MapType.google,
        coords: mapLauncher.Coords(viewModel.lat ?? 0, viewModel.lng ?? 0),
        title: viewModel.name ?? "",
        description: viewModel.name,
      );
    } else if (isApple ?? false) {
      await mapLauncher.MapLauncher.showMarker(
        mapType: mapLauncher.MapType.apple,
        coords: mapLauncher.Coords(viewModel.lat ?? 0, viewModel.lng ?? 0),
        title: viewModel.name ?? "",
        description: viewModel.name,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlaceListViewModel>(context);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: _getPlaceMarkers(vm.places),
            myLocationEnabled: true,
            mapType: vm.mapType,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.0902, 95.7129),
              zoom: 15,
            ),
          ),
          SafeArea(
            child: TextField(
              onSubmitted: (val) {
                vm.fetchPlacesByKeywordAndPosition(
                    val, _position.latitude, _position.longitude);
              },
              decoration: InputDecoration(
                labelText: "Search here",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Visibility(
            visible: vm.places.length > 0 ? true : false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => PlaceList(
                          places: vm.places,
                          onSelected: (vm) {
                            _openMapsFor(vm);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Show List",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 105.0,
            right: 10.0,
            child: FloatingActionButton(
              child: Icon(Icons.map),
              onPressed: () {
                vm.toggleMapType();
              },
            ),
          ),
        ],
      ),
    );
  }
}
