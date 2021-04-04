import 'package:city_care/pages/incidentReportPage.dart';
import 'package:city_care/view_models/incidentListViewModel.dart';
import 'package:city_care/view_models/reportIncidentViewModel.dart';
import 'package:city_care/widgets/incidentList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPageState createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  @override
  void initState() {
    super.initState();
    _populateAllIncidents();
  }

  void _populateAllIncidents() {
    Provider.of<IncidentListViewModel>(context, listen: false)
        .getAllIncidents();
  }

  _navigateToReportIncidentPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => ReportIncidentViewModel(),
          child: IncidentReportPage(),
        ),
        fullscreenDialog: true,
      ),
    );
    _populateAllIncidents();
  }

  _updateUI(IncidentListViewModel vm) {
    switch (vm.status) {
      case Status.loading:
        return Align(child: CircularProgressIndicator());
      case Status.empty:
        return Align(child: Text("No incidents found"));
      case Status.success:
        return IncidentList(incidents: vm.incidents);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<IncidentListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Incidents"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          _updateUI(vm),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0, bottom: 14.0),
                child: FloatingActionButton(
                  onPressed: () async {
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
