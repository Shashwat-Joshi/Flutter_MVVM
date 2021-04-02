import 'package:city_care/pages/incidentReportPage.dart';
import 'package:city_care/widgets/incidentList.dart';
import 'package:flutter/material.dart';

class IncidentListPage extends StatelessWidget {
  _navigateToReportIncidentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncidentReportPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incidents"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          IncidentList(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0, bottom: 14.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _navigateToReportIncidentPage(context);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
