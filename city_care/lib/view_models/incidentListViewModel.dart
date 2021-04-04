import 'package:city_care/services/webservice.dart';
import 'package:city_care/view_models/incidentViewModel.dart';
import 'package:flutter/cupertino.dart';

enum Status {
  loading,
  empty,
  success,
}

class IncidentListViewModel extends ChangeNotifier {
  List<IncidentViewModel> incidents = [];
  Status status = Status.empty;

  Future<void> getAllIncidents() async {
    status = Status.loading;
    final result = await WebService().getAllIncidents();
    this.incidents = result
        .map((incident) => IncidentViewModel(incident: incident))
        .toList();
    status = incidents.isEmpty ? Status.empty : Status.success;
    notifyListeners();
  }
}
