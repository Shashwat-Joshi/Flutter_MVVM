import 'package:city_care/models/incident.dart';

class IncidentViewModel {
  final Incident _incident;

  IncidentViewModel({
    required Incident incident,
  }) : this._incident = incident;

  String get title {
    return this._incident.title ?? "";
  }

  String get description {
    return this._incident.description ?? "";
  }
}
