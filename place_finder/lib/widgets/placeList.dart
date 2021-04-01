import 'package:flutter/material.dart';
import 'package:place_finder/utils/urlHelper.dart';
import 'package:place_finder/viewModels/placeViewModel.dart';

class PlaceList extends StatelessWidget {
  final List<PlaceViewModel> places;
  Function? onSelected;

  PlaceList({required this.places, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.places.length,
      itemBuilder: (context, index) {
        final place = this.places[index];
        return Column(
          children: [
            ListTile(
              onTap: () {
                this.onSelected!(place);
              },
              leading: Container(
                width: 100.0,
                height: 100.0,
                child: Image.network(
                  UrlHelper().photoUrlFromReference(place.photoURL ?? ""),
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object obj,
                          StackTrace? stacktrace) =>
                      Image.network(
                          "https://askleo.askleomedia.com/wp-content/uploads/2004/06/no_image-300x245.jpg"),
                ),
              ),
              title: Text(place.name ?? ""),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
