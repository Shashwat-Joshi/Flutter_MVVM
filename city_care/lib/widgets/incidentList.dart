import 'package:city_care/utils/constants.dart';
import 'package:city_care/view_models/incidentViewModel.dart';
import 'package:flutter/material.dart';

class IncidentList extends StatelessWidget {
  final List<IncidentViewModel> incidents;

  IncidentList({required this.incidents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: incidents.length,
      itemBuilder: (context, index) {
        final incident = incidents[index];
        return Column(
          children: [
            ListTile(
              leading: Image.network("${Constant.apiUrl}${incident.imageUrl}"),
              title: Text(incident.title),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
