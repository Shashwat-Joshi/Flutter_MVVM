import 'package:city_care/models/incident.dart';
import 'package:city_care/services/webservice.dart';
import 'package:flutter/foundation.dart';

class ReportIncidentViewModel extends ChangeNotifier {
  String? title;
  String? description;
  String? imagePath;

  Future<void> saveIncident() async {
    Incident incident = Incident(title: title, description: description);
    await WebService().saveIncident(incident);
  }
}
